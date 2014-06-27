<?php
$AUTOCONFIG = array(
    "directory" => "/var/www/owncloud/data",
    "dbtype" => "pgsql",
    "dbname" => "{{.PGSQL_ENV_POSTGRESQL_DB}}",
    "dbuser" => "{{.PGSQL_ENV_POSTGRESQL_USER}}",
    "dbpass" => "{{.PGSQL_ENV_POSTGRESQL_PASS}}",
    "dbhost" => "{{.PGSQL_PORT_5432_TCP_ADDR}}",
    "adminlogin" => "{{.OWNCLOUD_ADMIN_LOGIN}}",
    "adminpass" => "{{.OWNCLOUD_ADMIN_PASS}}",
);
