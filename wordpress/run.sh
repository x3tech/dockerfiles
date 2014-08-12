#!/bin/bash

readonly CONFDIR="/var/www/wordpress"

main() {
    generate_config
    exec_init
}

generate_config() {
    /bin/envtpl < "${CONFDIR}/wp-config.tpl.php" > "${CONFDIR}/wp-config.php"
}

exec_init() {
    exec /usr/sbin/runsvdir-start
}

main
