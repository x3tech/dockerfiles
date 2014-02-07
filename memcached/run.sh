#!/bin/sh

ARGS="-m${MEMCACHED_MEMORY} -t${MEMCACHED_THREADS}"
if [ "${MEMCACHED_VERBOSE:-0}" -eq 1 ]; then
    ARGS="${ARGS} -v"
fi

echo "Starting memcached..."
exec /usr/bin/memcached $ARGS
