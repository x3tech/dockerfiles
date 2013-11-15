FROM x3tech/arch-nginx-php
MAINTAINER 3onyc

RUN curl -SsL http://wordpress.org/wordpress-3.7.1.tar.gz | tar -C /tmp/ -zxvf - wordpress/ && \
    mv /tmp/wordpress/* /srv/http/ && \
    pacman -S --noconfirm php-gd php-mcrypt

ADD php.ini /etc/php/php.ini
ADD nginx.conf /etc/nginx/nginx.conf
ADD wp-config.php /srv/http/wp-config.php

VOLUME ["/srv/http/"]
