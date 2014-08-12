<?php
define('DB_NAME', '{{ .MYSQL_ENV_MYSQL_DATABASE }}');
define('DB_USER', '{{ .MYSQL_ENV_MYSQL_USER }}');
define('DB_PASSWORD', '{{ .MYSQL_ENV_MYSQL_PASSWORD }}');
define('DB_HOST', '{{ .MYSQL_PORT_3306_TCP_ADDR }}' . ":" . '{{ .MYSQL_PORT_3306_TCP_PORT }}');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('AUTH_KEY',         'put your unique phrase here');
define('SECURE_AUTH_KEY',  'put your unique phrase here');
define('LOGGED_IN_KEY',    'put your unique phrase here');
define('NONCE_KEY',        'put your unique phrase here');
define('AUTH_SALT',        'put your unique phrase here');
define('SECURE_AUTH_SALT', 'put your unique phrase here');
define('LOGGED_IN_SALT',   'put your unique phrase here');
define('NONCE_SALT',       'put your unique phrase here');

$table_prefix  = 'wp_';
define('WPLANG', '');
define('WP_DEBUG', false);

if (!defined('ABSPATH')) {
    define('ABSPATH', dirname(__FILE__) . '/');
}

require_once(ABSPATH . 'wp-settings.php');
