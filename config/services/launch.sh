docker network create vpuu-offline

cd wordpress/

docker-compose up -d

cp wp-config.php ./html

cp .htaccess ./html

cd ../transmission

./launch.sh

cd ../nextcloud

docker-compose up -d

cd ../calibre

docker-compose up -d

cd ../matomo/

./launch.sh

cd ../kiwix/

./launch.sh

sleep 10

echo "bringing up webserver"

cd ../nginx/

./launch.sh

