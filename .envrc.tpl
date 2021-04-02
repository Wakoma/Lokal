export PROJECT_NAME=vnet
export DEPLOYMENT_ENVIRONMENT=develop  # develop, staging, production
export PROJECT_ROOT=${PWD}
export PATH="${PROJECT_ROOT}:${PATH}"

# Cloud Provider Secrets
export HCLOUD_TOKEN=
export VAGRANT_IP=10.180.0.102

# Cloud Provider Variables
export HCLOUD_IMAGE=ubuntu-20.04
export HCLOUD_LOCATION=nbg1
export HCLOUD_SERVER_TYPE=cpx11
export ROOT_SSH_USER=root
export PRIMARY_SSH_USER=ubuntu

# Container Secrets
export ACME_EMAIL=
export TRAEFIK_BASICAUTH_USERS=''

# Container Variables
export DOCKER_PGID=$(grep docker /etc/group | cut -d ':' -f 3)
export PUID=$(id -u)
export PGID=$(id -g)
export TZ=Africa/Johannesburg
export DOMAIN=vnet.lan
export DOMAIN_VNET=${DOMAIN}
export DOMAIN_VNET_LOCAL=vnet.lokal.network
export DOMAIN_WORDPRESS=${DOMAIN_VNET}
export DOMAIN_WORDPRESS_WWW=www.${DOMAIN_VNET}
export DOMAIN_TRAEFIK=router.${DOMAIN_VNET}
export DOMAIN_NETDATA=monitor.${DOMAIN_VNET}
export DOMAIN_PROMETHEUS=metrics.${DOMAIN_VNET}
export DOMAIN_GRAFANA=dash.${DOMAIN_VNET}
export DOMAIN_MATOMO=analytics.${DOMAIN_VNET}
export DOMAIN_RESOURCESPACE=assets.${DOMAIN}
export DOMAIN_MAILHOG=mailhog.${DOMAIN_VNET}
export DOMAIN_KIWIX=learn.${DOMAIN_VNET}
export DOMAIN_TRANSMISSION=torrent.${DOMAIN_VNET}
export DOMAIN_NEXTCLOUD=nextcloud.${DOMAIN}
export DOMAIN_PORTAINER=portainer.${DOMAIN_VNET}
export DOMAIN_UNIFI_CONTROLLER=unifi.${DOMAIN_VNET}
export KIWIX_DATA_DIR=${PROJECT_ROOT}/config/services/kiwix/data
export TRANSMISSION_CONFIG_DIR=${PROJECT_ROOT}/config/services/transmission/config
export TRANSMISSION_DOWNLOADS_DIR=${PROJECT_ROOT}/config/services/transmission/downloads
export TRANSMISSION_WATCH_DIR=${PROJECT_ROOT}/config/services/transmission/watch
export NEXTCLOUD_CONFIG_DIR=${PROJECT_ROOT}/config/services/nextcloud/config

# Application Secrets
export MYSQL_ROOT_PASSWORD=default
export MYSQL_PASSWORD_WORDPRESS=wordpress
export MYSQL_PASSWORD_RESOURCESPACE=resourcespace
export MYSQL_PASSWORD_MATOMO=matoma
export MYSQL_PASSWORD_NEXTCLOUD=nextcloud
export UP_UNIFI_DEFAULT_URL=
export UP_UNIFI_DEFAULT_USER=
export UP_UNIFI_DEFAULT_PASS=

# Application Variables
export MYSQL_HOST=mariadb
export MYSQL_PORT=3601

export MYSQL_USER_WORDPRESS=wordpress
export MYSQL_DATABASE_WORDPRESS=wordpress
export MYSQL_URL_WORDPRESS=mysql://${MYSQL_USER_WORDPRESS}:${MYSQL_PASSWORD_WORDPRESS}@${MYSQL_HOST}:${MYSQL_PORT}/${MYSQL_DATABASE_WORDPRESS}

export MYSQL_USER_RESOURCESPACE=resourcespace
export MYSQL_DATABASE_RESOURCESPACE=resourcespace
export MYSQL_URL_RESOURCESPACE=mysql://${MYSQL_USER_RESOURCESPACE}:${MYSQL_PASSWORD_RESOURCESPACE}@${MYSQL_HOST}:${MYSQL_PORT}/${MYSQL_DATABASE_RESOURCESPACE}

export MYSQL_USER_MATOMO=matoma
export MYSQL_DATABASE_MATOMO=matoma
export MYSQL_URL_MATOMO=mysql://${MYSQL_USER_MATOMO}:${MYSQL_PASSWORD_MATOMO}@${MYSQL_HOST}:${MYSQL_PORT}/${MYSQL_DATABASE_MATOMO}

export MYSQL_USER_NEXTCLOUD=nextcloud
export MYSQL_DATABASE_NEXTCLOUD=nextcloud
export MYSQL_URL_NEXTCLOUD=mysql://${MYSQL_USER_NEXTCLOUD}:${MYSQL_PASSWORD_NEXTCLOUD}@${MYSQL_HOST}:${MYSQL_PORT}/${MYSQL_DATABASE_NEXTCLOUD}
