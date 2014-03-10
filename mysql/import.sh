#!/bin/bash

MYSQL_DATABASE=${MYSQL_ENV_MYSQL_DATABASE:-""}
MYSQL_ROOT_PASSWORD=${MYSQL_ENV_MYSQL_ROOT_PASSWORD:-""}
ARGS="-h${MYSQL_PORT_3306_TCP_ADDR} -uroot"

if [ ! -z "${MYSQL_ROOT_PASSWORD}" ]; then
    ARGS="${ARGS} -p'${MYSQL_ROOT_PASSWORD}'"
fi

if [ ! -z "${MYSQL_DATABASE}" ]; then
    ARGS="${ARGS} ${MYSQL_DATABASE}"
fi

cat - | eval "mysql ${ARGS}"
