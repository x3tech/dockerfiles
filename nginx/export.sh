#!/bin/bash
BACKUP_FOLDER="/backups"
BACKUP_FILENAME="www_$(date '+%Y-%m-%d_%H-%M-%S').tar.gz"

if [ ! -d "$BACKUP_FOLDER" ]; then
    mkdir -p "$BACKUP_FOLDER"
fi

tar --gzip \
    --create \
    --verbose \
    --file "${BACKUP_FOLDER}/${BACKUP_FILENAME}" \
    -C "/var" \
    www
