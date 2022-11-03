set -x
sudo mkdir -p /opt/lokal/base
sudo chown -R ubuntu:ubuntu /opt/lokal

mkdir -p /opt/lokal/base/mysql
if [ ! -e /opt/lokal/base/mysql/data ]; then
sudo cp -r /var/lib/docker/volumes/mysql/_data /opt/lokal/base/mysql/data
sudo chown -R ubuntu:ubuntu /opt/lokal/base/mysql/data
fi

mkdir -p /opt/lokal/wordpress
if [ ! -e /opt/lokal/wordpress/data ]; then
sudo cp -r /var/lib/docker/volumes/wordpress/_data/wp-content /opt/lokal/wordpress/data
sudo chown -R ubuntu:ubuntu /opt/lokal/wordpress/data
fi

mkdir -p /opt/lokal/base/grafana
if [ ! -e /opt/lokal/base/grafana/data ]; then
sudo cp -r /var/lib/docker/volumes/grafana/_data /opt/lokal/base/grafana/data
sudo chown -R ubuntu:ubuntu /opt/lokal/base/grafana/data
fi

mkdir -p /opt/lokal/base/prometheus
if [ ! -e /opt/lokal/base/prometheus/data ]; then
sudo cp -r /var/lib/docker/volumes/prometheus/_data /opt/lokal/base/prometheus/data
sudo chown -R ubuntu:ubuntu /opt/lokal/base/prometheus/data
fi

mkdir -p /opt/lokal/base/portainer
if [ ! -e /opt/lokal/base/portainer/data ]; then
sudo cp -r /var/lib/docker/volumes/portainer/_data /opt/lokal/base/portainer/data
sudo chown -R ubuntu:ubuntu /opt/lokal/base/portainer/data
fi

mkdir -p /opt/lokal/unifi
if [ ! -e /opt/lokal/unifi/data ]; then
sudo cp -r /var/lib/docker/volumes/unifi-controller/_data /opt/lokal/unifi/data
sudo chown -R ubuntu:ubuntu /opt/lokal/unifi/data
fi

mkdir -p /opt/lokal/jellyfin
if [ ! -e /opt/lokal/jellyfin/data ]; then
sudo cp -r /var/lib/docker/volumes/jellyfin/_data /opt/lokal/jellyfin/data
sudo chown -R ubuntu:ubuntu /opt/lokal/jellyfin/data
fi

mkdir -p /opt/lokal/base/traefik/certs
if [ ! -e /opt/lokal/base/traefik/certs/lokal.network.crt ]; then
sudo cp -r /media/ssl/certs/lokal.network/lokal.network.cer /opt/lokal/base/traefik/certs/lokal.network.crt
sudo cp -r /media/ssl/certs/lokal.network/lokal.network.key /opt/lokal/base/traefik/certs/lokal.network.key
sudo chown -R ubuntu:ubuntu /opt/lokal/base/traefik/certs
fi
