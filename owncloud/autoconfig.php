<?php
$AUTOCONFIG = array(
    "directory" => "/opt/owncloud/data",
    "dbtype" => "pgsql",
    "dbname" => getenv('PGSQL_ENV_PG_USER') . "_" . getenv('PGSQL_ENV_PG_DB'),
    "dbuser" => getenv('PGSQL_ENV_PG_USER'),
    "dbpass" => getenv('PGSQL_ENV_PG_PASSWORD'),
    "dbhost" => getenv('PGSQL_PORT_5432_TCP_ADDR'),
    "adminlogin" => getenv("OWNCLOUD_ADMIN_LOGIN"),
    "adminpass" => getenv("OWNCLOUD_ADMIN_PASS"),
);
