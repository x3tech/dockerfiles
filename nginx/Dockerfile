FROM ubuntu:14.04
MAINTAINER 3onyc

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

EXPOSE 80
VOLUME ["/var/www"]

ADD start.sh /start
ADD import.sh /import
ADD export.sh /export

ADD index.html /var/www/
ADD nginx.conf /etc/nginx/

CMD ["/start"]
