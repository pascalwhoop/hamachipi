docker run \
    --name="hamachi" \
    --net="host" \
    --privileged=true \
    -e ACCOUNT="pascal.brokmeier@gmail.com" \
    -v "/home/pi/Apps/hamachipi/config":"/config":rw \
    -v "/etc/localtime":"/etc/localtime":ro pascalwhoop/hamachi
