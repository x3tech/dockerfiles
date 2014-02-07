FROM x3tech/arch-nginx-php
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm php-pgsql php-mcrypt php-intl ffmpeg owncloud && \
    pacman -Scc --noconfirm && \
    sed -i "s/;opcache.enable=0/opcache.enable=1/g" /etc/php/php.ini && \
    sed -i "s/;extension=curl.so/extension=curl.so/g" /etc/php/php.ini && \
    sed -i "s/;extension=mcrypt.so/extension=mcrypt.so/g" /etc/php/php.ini && \
    sed -i "s/;extension=intl.so/extension=intl.so/g" /etc/php/php.ini && \
    sed -i "s/;extension=zip.so/extension=zip.so/g" /etc/php/php.ini && \
    sed -i "s/;extension=pgsql.so/extension=pgsql.so/g" /etc/php/php.ini && \
    sed -i "s/;extension=exif.so/extension=exif.so/g" /etc/php/php.ini && \
    sed -i "s/;extension=openssl.so/extension=openssl.so/g" /etc/php/php.ini && \
    sed -i "s/;extension=gd.so/extension=gd.so/g" /etc/php/php.ini && \
    sed -i "s/;extension=xmlrpc.so/extension=xmlrpc.so/g" /etc/php/php.ini && \
    sed -i "s/;extension=iconv.so/extension=iconv.so/g" /etc/php/php.ini && \
    sed -i "s/;extension=pdo_pgsql.so/extension=pdo_pgsql.so/g" /etc/php/php.ini && \
    sed -i "s/;zend_extension=opcache.so/zend_extension=opcache.so/g" /etc/php/php.ini && \
    sed -i "/^open_basedir =/d" /etc/php/php.ini && \
    mkdir -p /opt/owncloud/{apps,data} && \
    mv /usr/share/webapps/owncloud/config /opt/owncloud/config && \
    ln -s /opt/owncloud/config /usr/share/webapps/owncloud/config && \
    ln -s /opt/owncloud/data /usr/share/webapps/owncloud/data


ADD user.config.php /opt/owncloud/config/
ADD autoconfig.php /opt/owncloud/config/
ADD nginx.conf /etc/nginx/
ADD uwsgi.ini /etc/

RUN chown -R http:http /opt/owncloud

# Should be specified on creation
ENV OWNCLOUD_HOSTNAME example.com
ENV OWNCLOUD_SALT changeme!
ENV OWNCLOUD_ADMIN_LOGIN admin
ENV OWNCLOUD_ADMIN_PASS changeme!

# Web port
ENV WEB_PORT 80
EXPOSE 80

VOLUME ["/opt/owncloud/"]
