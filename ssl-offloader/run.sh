#!/bin/bash
readonly TPL="/etc/nginx/nginx.conf.tpl"
readonly CONF="/etc/nginx/nginx.conf"

main() {
    go-envtpl < "$TPL" > "$CONF"
    exec /usr/sbin/runsvdir-start
}

main
