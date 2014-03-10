#!/bin/bash
BACKUP_FOLDER="/backups"
BACKUP_FILENAME="mysql_$(date '+%Y-%m-%d_%H-%M-%S')"

MYSQL_DATABASE=${MYSQL_ENV_MYSQL_DATABASE:-""}
MYSQL_ROOT_PASSWORD=${MYSQL_ENV_MYSQL_ROOT_PASSWORD:-""}
ARGS="-h${MYSQL_PORT_3306_TCP_ADDR} -uroot"

if [ ! -z "${MYSQL_ROOT_PASSWORD}" ]; then
    ARGS="${ARGS} -p'${MYSQL_ROOT_PASSWORD}'"
fi

if [ -z "${MYSQL_DATABASE}" ]; then
    ARGS="${ARGS} --all-databases"
else
    ARGS="${ARGS} ${MYSQL_DATABASE}"
    BACKUP_FILENAME="${BACKUP_FILENAME}_${MYSQL_DATABASE}"
fi

BACKUP_FILENAME="${BACKUP_FILENAME}.sql.gz"

if [ ! -d "$BACKUP_FOLDER" ]; then
    mkdir -p "$BACKUP_FOLDER"
fi

eval "mysqldump ${ARGS}" | gzip -9 > "${BACKUP_FOLDER}/${BACKUP_FILENAME}"
