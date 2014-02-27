#!/bin/sh

ARGS="-m${MEMCACHED_MEMORY} -t${MEMCACHED_THREADS} -v"

echo "Starting memcached..."
exec /usr/bin/memcached $ARGS
