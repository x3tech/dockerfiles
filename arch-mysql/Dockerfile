FROM x3tech/arch-infra-base
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm mariadb mariadb-clients && \
    pacman -Scc --noconfirm && \
    echo "[program:mysqld]" > /etc/supervisor.d/mysqld.ini && \
    echo "command=/usr/bin/mysqld_safe" >> /etc/supervisor.d/mysqld.ini && \
    echo "stopwaitsecs=30" >> /etc/supervisor.d/mysqld.ini

EXPOSE 3306
VOLUME ["/var/lib/mysql/"]

ADD my.cnf /etc/mysql/
ADD 30_mysql_init.sh /opt/init.d/
