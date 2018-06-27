docker run -d \
    --name="hamachi" \
    --net="host" \
    --privileged="true" \
    -e ACCOUNT="pascal.brokmeier@gmail.com" \
    -v "/home/pascalwhoop/Apps/hamachi/config":"/config":rw \
    -v "/etc/localtime":"/etc/localtime":ro pascalwhoop/hamachi
