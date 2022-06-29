TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
BACKUP_DIR=${PROJECT_ROOT}/local/backups/resourcespace/${TIMESTAMP}
mkdir -p ${BACKUP_DIR}
dc exec -T mariadb mysqldump -u ${MYSQL_USER_RESOURCESPACE} -p${MYSQL_PASSWORD_RESOURCESPACE} --routines --triggers ${MYSQL_DATABASE_RESOURCESPACE} | gzip -9 > ${BACKUP_DIR}/${TIMESTAMP}.mysql.dump.sql.gzip
dc exec -T resourcespace tar cf - /var/www/html | gzip -9 > ${BACKUP_DIR}/${TIMESTAMP}.resourcespace.vol.tar.gzip
