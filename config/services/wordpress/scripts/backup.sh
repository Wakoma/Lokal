TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
BACKUP_DIR=${PROJECT_ROOT}/local/backups/wordpress/${TIMESTAMP}
mkdir -p ${BACKUP_DIR}
dc exec -T mariadb mysqldump -u ${MYSQL_USER_WORDPRESS} -p${MYSQL_PASSWORD_WORDPRESS} --routines --triggers ${MYSQL_DATABASE_WORDPRESS} | gzip -9 > ${BACKUP_DIR}/${TIMESTAMP}.mysql.dump.sql.gzip
dc exec -T wordpress tar cf - /var/www/html | gzip -9 > ${BACKUP_DIR}/${TIMESTAMP}.wordpress.vol.tar.gzip
