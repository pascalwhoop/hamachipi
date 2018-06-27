FROM arm32v7/debian:latest
MAINTAINER pascalwhoop <public@pascalbrokmeier.de>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Install Hamachi
ADD https://www.vpn.net/installers/logmein-hamachi-2.1.0.198-armhf.tgz /tmp/hamachi.tgz
RUN mkdir -p /opt/logmein-hamachi && \
    tar -zxf /tmp/hamachi.tgz --strip-components 1 -C /opt/logmein-hamachi && \
    ln -sf /opt/logmein-hamachi/hamachid /usr/bin/hamachi && \
    rm /tmp/hamachi.tgz

VOLUME /config

# Add install.sh to execute during container startup
RUN mkdir -p /etc/my_init.d
ADD install.sh /etc/my_init.d/install.sh
RUN chmod +x /etc/my_init.d/install.sh

# Add hamachi.sh to runit
RUN mkdir -p /etc/service/hamachi
ADD hamachi.sh /etc/service/hamachi/run
RUN chmod +x /etc/service/hamachi/run
CMD /etc/service/hamachi/run

