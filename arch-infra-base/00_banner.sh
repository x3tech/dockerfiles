#!/bin/bash

if [ "$1" == "start" ]; then
    echo " [i] Container: $HOSTNAME"
    echo " [i] IP: $IP_ADDR"
    echo " [i] Time: $(date)"
fi
