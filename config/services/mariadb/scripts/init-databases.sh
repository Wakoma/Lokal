#!/usr/bin/env bash
set -euf -o pipefail

docker exec mariadb bash -c "until mysqladmin status -p${MYSQL_ROOT_PASSWORD}; do sleep 5; echo Retrying...; done"
printf "\
CREATE USER IF NOT EXISTS '${MYSQL_USER_WORDPRESS}'@'%%' IDENTIFIED BY '${MYSQL_PASSWORD_WORDPRESS}';\n\
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE_WORDPRESS};\n\
GRANT ALL ON \`${MYSQL_DATABASE_WORDPRESS}\`.* TO '${MYSQL_USER_WORDPRESS}'@'%%';\n\

FLUSH PRIVILEGES;\n\
" | dc exec -T mariadb mysql -p${MYSQL_ROOT_PASSWORD}
