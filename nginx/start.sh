#!/bin/bash

if [ ! -d "/var/log/nginx" ]; then
    echo "Creating NGINX log folder."
    mkdir "/var/log/nginx"
fi

echo "Starting NGINX..."
exec /usr/sbin/nginx
