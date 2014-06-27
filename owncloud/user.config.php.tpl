<?php

$CONFIG = array(
    "datadirectory" => "/var/www/owncloud/data",
    "dbtype" => "pgsql",
    "dbname" => "{{.PGSQL_ENV_POSTGRESQL_DB}}",
    "dbuser" => "{{.PGSQL_ENV_POSTGRESQL_USER}}",
    "dbpassword" => "{{.PGSQL_ENV_POSTGRESQL_PASS}}",
    "dbhost" => "{{.PGSQL_PORT_5432_TCP_ADDR}}",
    "overwritehost" => "{{.OWNCLOUD_HOSTNAME}}",
    "user_backends" => array(),
    "apps_paths" => array (
        0 => array (
            "path" => OC::$SERVERROOT."/apps",
            "url" => "/apps",
            "writable" => true,
        ),
    ),
);
