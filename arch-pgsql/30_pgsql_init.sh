#!/bin/bash
if [ "$1" == "start" ]; then
  (
    while ! (echo "" | su - postgres -c '/usr/bin/psql -U postgres 2>&1 > /dev/null' 2>&1 > /dev/null); do sleep 1; done
    echo "PostgreSQL Is up, initialising..."

    # Create the user and database
    echo "CREATE USER \"${PG_USER}\" WITH CREATEDB PASSWORD '${PG_PASSWORD}';" \
         "CREATE DATABASE \"${PG_USER}_${PG_DB}\" WITH OWNER \"${PG_USER}\";" \
         | su - postgres -c 'psql'
    

    echo "Done... self-destructing..."
    rm $0
  ) &
fi
