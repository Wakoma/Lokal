docker run --rm -d --name nginx-test -v $PWD/nginx:/etc/nginx --network vnet-vlan nginx
docker network connect bridge nginx-test

