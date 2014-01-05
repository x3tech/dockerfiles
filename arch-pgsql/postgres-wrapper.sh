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
fi

exec /usr/bin/postgres -D "${PG_DATA}"
