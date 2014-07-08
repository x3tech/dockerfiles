#!/bin/bash
STOP=0

rewrite_topdir() {
    find . \
        -name "*.sh" \
        -exec sed -E -i 's#^TOPDIR=.*#TOPDIR=/opt/seafile/data#g' {} \;

    find . \
        -name "*.py" \
        -exec sed -E -i 's#^install_topdir =.*#install_topdir = "/opt/seafile/data"#g' {} \;
}

main() {
    cd /opt/seafile/seafile-server-*
    rewrite_topdir

    if [ ! -e /opt/seafile/data/seafile-data/blocks ]; then
        su seafile -c "./setup-seafile.sh"
    fi

    start
    if [ "$STOP" -eq 1 ]; then
        stop
    fi

    trap stop SIGINT SIGTERM SIGQUIT

    while true; do
        sleep .5
    done
}

start() {
    trap cue_stop SIGINT SIGTERM SIGQUIT

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

main
