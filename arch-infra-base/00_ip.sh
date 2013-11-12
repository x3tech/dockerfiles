#!/bin/bash

case $1 in
  start)
    echo " [^] Setting container IP in etcd..."
    curl -SsL "http://$ETCD_ADDR/v1/keys/hosts/$HOSTNAME/ip" -d "value=$IP_ADDR" > /dev/null
    ;;
  stop)
    echo " [v] Removing container IP from etcd..."
    curl -SsL "http://$ETCD_ADDR/v1/keys/hosts/$HOSTNAME/ip" -X DELETE > /dev/null
    ;;
esac
