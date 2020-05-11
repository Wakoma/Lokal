docker run --rm -d -p 80:80 --restart unless-stopped --network vpuu-offline  --name nginx -v $PWD/nginx:/etc/nginx nginx

