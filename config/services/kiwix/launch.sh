./quickstart.sh
docker run -v $PWD/data:/data --restart unless-stopped -d --name kiwix --network vpuu-offline kiwix/kiwix-serve --library library.xml
