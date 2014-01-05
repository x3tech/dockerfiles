FROM x3tech/arch-infra-base
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm postgresql && \
    pacman -Scc --noconfirm && \
    echo "[program:postgres]" > /etc/supervisor.d/postgres.ini && \
    echo "command=/opt/postgres-wrapper.sh" >> /etc/supervisor.d/postgres.ini && \
    echo "user=postgres" >> /etc/supervisor.d/postgres.ini && \
    echo "stopwaitsecs=30" >> /etc/supervisor.d/postgres.ini

EXPOSE 5432
VOLUME ["/var/lib/postgres/"]

ADD postgres-wrapper.sh /opt/
ADD 30_pgsql_init.sh /opt/init.d/
