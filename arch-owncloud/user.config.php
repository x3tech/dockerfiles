<?php

$CONFIG = array(
    "dbtype" => "pgsql",
    "dbname" => getenv('PGSQL_ENV_PG_USER') . "_" . getenv('PGSQL_ENV_PG_DB'),
    "dbuser" => getenv('PGSQL_ENV_PG_USER'),
    "dbpassword" => getenv('PGSQL_ENV_PG_PASSWORD'),
    "dbhost" => getenv('PGSQL_PORT_5432_TCP_ADDR'),
    "passwordsalt" => getenv('OWNCLOUD_SALT'),
    "overwritehost" => getenv('OWNCLOUD_HOSTNAME'),
    'user_backends'=>array(),
    'apps_paths' => array (
        0 => array (
            'path' => OC::$SERVERROOT.'/apps',
            'url' => '/apps',
            'writable' => false,
        ),
        1 => array (
            'path' => '/opt/owncloud/apps',
            'url' => '/userapps',
            'writable' => true,
        ),
    ),
);
