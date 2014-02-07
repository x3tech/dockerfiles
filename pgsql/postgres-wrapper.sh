#!/bin/bash
PG_DATA="/var/lib/postgres/data"

if [ ! -f "$PG_DATA/pg_hba.conf" ]; then
  echo "${PG_ROOT_PASSWORD}" > /tmp/pg-password
  initdb --locale en_US.UTF-8 \
         --pwfile=/tmp/pg-password \
         --pgdata="${PG_DATA}"
  rm /tmp/pg-password
  echo "host all all 0.0.0.0/0 md5" >> "${PG_DATA}/pg_hba.conf"
  echo "host all all ::/0 md5" >> "${PG_DATA}/pg_hba.conf"
  echo "listen_addresses = '*'" >> "${PG_DATA}/postgresql.conf"

  # Start the process of initialising the user and database
  (
    while ! (echo "" | /usr/bin/psql -U postgres 2>&1 > /dev/null); do sleep 1; done
    echo "PostgreSQL Is up, initialising..."

    # Create the user and database
    echo "CREATE USER \"${PG_USER}\" WITH CREATEDB PASSWORD '${PG_PASSWORD}';" \
         "CREATE DATABASE \"${PG_USER}_${PG_DB}\" WITH OWNER \"${PG_USER}\";" \
         | psql
  ) &
fi

exec /usr/bin/postgres -D "${PG_DATA}" "$@"
