#!/bin/bash
DESTINATION_FOLDER="/var"

echo "Importing..."
cat - | tar --preserve-permissions \
            --extract \
            --verbose \
            --gzip \
            --directory "${DESTINATION_FOLDER}" \
            --file -

echo "Done."
