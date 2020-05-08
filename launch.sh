docker network create vpuu-offline



cd nginx/

./launch.sh

cd ../wordpress/

docker-compose up -d

cd ../transmission

./launch.sh

cd ../nextcloud

docker-compose up -d

