FROM x3tech/runit
MAINTAINER 3onyc

RUN apt-get update && \
    apt-get install -y nginx nginx-extras && \
    apt-get clean

EXPOSE 80
VOLUME ["/var/www"]

ENV BACKUP_FOLDER /var/www
ENV BACKUP_TARGET /backups

ADD import.sh /import
ADD export.sh /export
ADD service /etc/service

ADD index.html /var/www/
ADD nginx.conf /etc/nginx/
