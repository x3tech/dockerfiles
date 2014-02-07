FROM x3tech/arch-nginx-php
MAINTAINER 3onyc

RUN curl -SsL http://wordpress.org/wordpress-3.8.tar.gz | tar -C /tmp/ --exclude="wp-config-sample.php" -zxvf - wordpress/ && \
    mv /tmp/wordpress/* /srv/http/ && \
    chown -R http:http /srv/http/ && \
    chmod -R og-rwx,u+rwX /srv/http/ && \
    pacman -S --noconfirm php-gd php-mcrypt

ADD php.ini /etc/php/php.ini
ADD nginx.conf /etc/nginx/nginx.conf
ADD wp-config.php /srv/http/wp-config.php

VOLUME ["/srv/http/"]
