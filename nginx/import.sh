#!/bin/bash
if [ -z "$BACKUP_FOLDER" ]; then
    echo "BACKUP_FOLDER not specified, exiting"
    exit 1
fi

if [ ! -d "$BACKUP_FOLDER" ]; then
    echo "BACKUP_FOLDER doesn't exist, exiting"
    exit 1
fi

main() {
    echo "Importing..."
    cat - | tar --preserve-permissions \
                --extract \
                --verbose \
                --gzip \
                --directory "$(dirname "$BACKUP_FOLDER")" \
                --file -

    echo "Done."
}

main
