set -euo pipefail

export TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
export THIS_BACKUP_DIR=${BACKUP_DIR}/${TIMESTAMP}
mkdir -p ${THIS_BACKUP_DIR}
dc exec -T mariadb mysqldump -u root -p${MYSQL_ROOT_PASSWORD} --routines --triggers ${MYSQL_DATABASE_WORDPRESS} | gzip -9 > ${THIS_BACKUP_DIR}/${TIMESTAMP}.wordpress.mysql.dump.sql.gzip
dc exec -T mariadb mysqldump -u root -p${MYSQL_ROOT_PASSWORD} --routines --triggers ${MYSQL_DATABASE_MATOMO} | gzip -9 > ${THIS_BACKUP_DIR}/${TIMESTAMP}.matomo.mysql.dump.sql.gzip
dc exec -T mariadb mysqldump -u root -p${MYSQL_ROOT_PASSWORD} --routines --triggers ${MYSQL_DATABASE_RESOURCESPACE} | gzip -9 > ${THIS_BACKUP_DIR}/${TIMESTAMP}.resourcespace.mysql.dump.sql.gzip
dc exec -T mariadb mysqldump -u root -p${MYSQL_ROOT_PASSWORD} --routines --triggers ${MYSQL_DATABASE_NEXTCLOUD} | gzip -9 > ${THIS_BACKUP_DIR}/${TIMESTAMP}.nextcloud.mysql.dump.sql.gzip
/usr/local/bin/docker-compose -f ${PROJECT_ROOT}/config/services/backup/backup.yml run --rm backup
echo Done!
