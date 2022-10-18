set -x
sudo mkdir -p /opt/lokal/base
sudo chown -R ubuntu:ubuntu /opt/lokal

mkdir -p /opt/lokal/base/mysql
sudo cp -r /var/lib/docker/volumes/mysql/_data /opt/lokal/base/mysql/data
sudo chown -R ubuntu:ubuntu /opt/lokal/base/mysql/data

mkdir -p /opt/lokal/wordpress
sudo cp -r /var/lib/docker/volumes/wordpress/_data/wp-content /opt/lokal/wordpress/data
sudo chown -R ubuntu:ubuntu /opt/lokal/wordpress/data

mkdir -p /opt/lokal/base/grafana
sudo cp -r /var/lib/docker/volumes/grafana/_data /opt/lokal/base/grafana/data
sudo chown -R ubuntu:ubuntu /opt/lokal/base/grafana/data

mkdir -p /opt/lokal/base/prometheus
sudo cp -r /var/lib/docker/volumes/prometheus/_data /opt/lokal/base/prometheus/data
sudo chown -R ubuntu:ubuntu /opt/lokal/base/prometheus/data

mkdir -p /opt/lokal/base/portainer
sudo cp -r /var/lib/docker/volumes/portainer/_data /opt/lokal/base/portainer/data
sudo chown -R ubuntu:ubuntu /opt/lokal/base/portainer/data

mkdir -p /opt/lokal/unifi
sudo cp -r /var/lib/docker/volumes/unifi-controller/_data /opt/lokal/unifi/data
sudo chown -R ubuntu:ubuntu /opt/lokal/unifi/data

mkdir -p /opt/lokal/base/traefik/certs
sudo cp -r /media/ssl/certs/lokal.network /opt/lokal/base/traefik/certs
sudo chown -R ubuntu:ubuntu /opt/lokal/base/traefik/certs
mv /opt/lokal/base/traefik/certs/lokal.network/lokal.network.cer /opt/lokal/base/traefik/certs/lokal.network/lokal.network.crt
