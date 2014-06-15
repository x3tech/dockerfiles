FROM x3tech/nginx-php
MAINTAINER 3onyc

EXPOSE 80

RUN rm -rf /var/www/*
ADD baikal-regular-0.2.7.tgz /var/www/
ADD nginx.conf /etc/nginx/nginx.conf
