FROM x3tech/runit
MAINTAINER 3onyc

RUN apt-get update && \
    apt-get install -y apache2 apache2-mpm-event && \
    apt-get clean && \
    rm -rf /var/www/*

EXPOSE 80
VOLUME ["/var/www"]

ADD import.sh /import
ADD export.sh /export
ADD service /etc/service

ADD index.html /var/www/
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
