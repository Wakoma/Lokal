docker run \
  --rm \
  --name=transmission \
  --network vpuu-offline \
  -d \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e TRANSMISSION_WEB_HOME=/combustion-release/ `#optional` \
  -e USER=username `#optional` \
  -e PASS=password `#optional` \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v $PWD/config:/config \
  -v $PWD/downloads:/downloads \
  -v $PWD/watch:/watch \
  linuxserver/transmission