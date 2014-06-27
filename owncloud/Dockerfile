FROM x3tech/nginx-php
MAINTAINER 3onyc

ADD owncloud-6.0.3.tar.bz2 /var/www/

=======
# Install dependencies
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y php5-pgsql php5-common php5-gd php-xml-parser php5-intl php5-mcrypt php5-curl php5-json php5-imagick && \
    apt-get clean && \
    chown -R www-data:www-data /var/www/owncloud

ADD user.config.php.tpl /var/www/owncloud/config/
ADD autoconfig.php.tpl /var/www/owncloud/config/
ADD nginx.conf /etc/nginx/
ADD uwsgi.ini /etc/
ADD go-envtpl /bin/envtpl
ADD run.sh /run.sh

# Should be specified on creation
ENV OWNCLOUD_HOSTNAME localhost
ENV OWNCLOUD_ADMIN_LOGIN admin
ENV OWNCLOUD_ADMIN_PASS changeme!

# Web port
EXPOSE 80

CMD ["/run.sh"]
