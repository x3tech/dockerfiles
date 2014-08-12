FROM x3tech/nginx-php
MAINTAINER 3onyc

ADD wordpress-3.9.2.tar.gz /var/www/
RUN chown -R www-data:www-data /var/www/wordpress/ && \
    chmod -R og-rwx,u+rX /var/www/ && \
    chmod -R u+w /var/www/wordpress/wp-content/ && \
    apt-get update && \
    apt-get install -y php5-gd php5-mcrypt php5-mysql && \
    apt-get clean

ADD run.sh /run.sh
ADD build/bin/envtpl /bin/envtpl
ADD uwsgi.ini /etc/uwsgi.ini
ADD nginx.conf /etc/nginx/nginx.conf
ADD wp-config.tpl.php /var/www/wordpress/wp-config.tpl.php

ENV BACKUP_FOLDER /var/www/wordpress/wp-content

VOLUME ["/var/www/wordpress/wp-content/"]
EXPOSE 80

CMD ["/run.sh"]
