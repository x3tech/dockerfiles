FROM x3tech/arch-nginx-php
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm mariadb mariadb-clients && \
    pacman -Scc --noconfirm && \
    echo "[program:mysql]" > /etc/supervisor.d/mysql.ini && \
    echo "command=/usr/bin/mysqld_safe" >> /etc/supervisor.d/mysql.ini

ADD 30_mysql_init.sh /opt/init.d/
