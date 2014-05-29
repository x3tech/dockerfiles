FROM x3tech/nginx
MAINTAINER 3onyc

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y uwsgi-plugin-php && \
    apt-get clean

ADD nginx.conf /etc/nginx/nginx.conf
ADD uwsgi.ini /etc/uwsgi.ini
ADD service /etc/service
ADD test.php /var/www/test.php
