#!/bin/bash
STOP=0

cd /opt/seafile/seafile-server-*
if [ ! -e /opt/seafile/data/blocks ]; then
    bash /modify-setup-seafile.sh
    su seafile -c "./setup-seafile.sh"
fi

start() {
    trap cue_stop SIGINT SIGTERM
    su seafile -c "./seafile.sh start"
    su seafile -c "./seahub.sh start"
}

cue_stop() {
    STOP=1
}

stop() {
    su seafile -c "./seafile.sh stop"
    su seafile -c "./seahub.sh stop"
    exit 0
}

start
if [ "$STOP" -eq 1 ]; then
    stop
fi

trap stop SIGINT SIGTERM

while [ 1 ]; do
  sleep 10
done
