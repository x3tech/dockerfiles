#!/bin/bash

readonly CONFDIR="/var/www/owncloud/config"

main() {
    generate_config
    exec_init
}

generate_config() {
    envtpl < "${CONFDIR}/user.config.php.tpl" > "${CONFDIR}/user.config.php"

    # Should only be generated once, and then deleted
    if [ -f "${CONFDIR}/autoconfig.php.tpl" ]; then
        envtpl < "${CONFDIR}/autoconfig.php.tpl" > "${CONFDIR}/autoconfig.php"
        rm "${CONFDIR}/autoconfig.php.tpl"
    fi
}

exec_init() {
    exec /usr/sbin/runsvdir-start
}

main
