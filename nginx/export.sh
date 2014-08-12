#!/bin/bash
if [ -z "$BACKUP_FOLDER" ]; then
    echo "BACKUP_FOLDER not specified, exiting"
    exit 1
fi

if [ -z "$BACKUP_TARGET" ]; then
    echo "BACKUP_TARGET not specified, exiting"
    exit 1
fi

if [ ! -d "$BACKUP_FOLDER" ]; then
    echo "BACKUP_FOLDER doesn't exist, exiting"
    exit 1
fi

readonly BACKUP_FILENAME="$(basename "$BACKUP_FOLDER")_$(date '+%Y-%m-%d_%H-%M-%S').tar.gz"

create_target() {
    if [ ! -d "$BACKUP_TARGET" ]; then
        mkdir -p "$BACKUP_TARGET"
    fi
}

main() {
    tar --gzip \
        --create \
        --verbose \
        --file "${BACKUP_TARGET}/${BACKUP_FILENAME}" \
        --directory "$(dirname "$BACKUP_FOLDER")" \
        "$(basename "$BACKUP_FOLDER")"
}

main
