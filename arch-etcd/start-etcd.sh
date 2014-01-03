#!/bin/bash

if [ ! -d /etc/etcd ]; then
  mkdir /etc/etcd
fi

exec /usr/bin/etcd -c "$IP_ADDR:4001" -s "$IP_ADDR:7001" -n "$HOSTNAME" -d /etc/etcd/
