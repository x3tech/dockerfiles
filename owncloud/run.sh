#!/bin/bash

readonly CONFDIR="/var/www/owncloud/config"

main() {
    envtpl < "${CONFDIR}/user.config.php.tpl" > "${CONFDIR}/user.config.php"
    envtpl < "${CONFDIR}/autoconfig.php.tpl" > "${CONFDIR}/autoconfig.php"

    exec /usr/sbin/runsvdir-start
}

main
