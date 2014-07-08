user  www-data www-data;
worker_processes {{ .NGINX_WORKERS }};
daemon off;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    error_log     stderr info;
    access_log    /dev/stdout;

    keepalive_timeout   30;
    types_hash_max_size 2048;

    upstream backends {
        server {{ .UPSTREAM_IP }}:{{ .UPSTREAM_PORT }};
    }

    server {
        listen 443 default;
        ssl on;

        ssl_certificate     {{ .SSL_CERT_PATH }};
        ssl_certificate_key {{ .SSL_CERT_KEY_PATH }};
        ssl_dhparam         {{ .SSL_DH_PARAM }};

        ssl_session_timeout 5m;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2; # No need for SSLv3 / TLSv1.0
        ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK';
        ssl_prefer_server_ciphers on;
        ssl_session_cache shared:SSL:50m;

        location / {
            proxy_pass http://backends;
        }
    }
}
