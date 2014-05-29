FROM x3tech/runit
MAINTAINER 3onyc

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

EXPOSE 80
VOLUME ["/var/www"]

ADD import.sh /import
ADD export.sh /export
ADD service /etc/service

ADD index.html /var/www/
ADD nginx.conf /etc/nginx/
