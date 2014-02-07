FROM x3tech/arch-infra-base
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm memcached && \
    pacman -Scc --noconfirm && \
    echo "[program:memcached]" > /etc/supervisor.d/memcached.ini && \
    echo "command=/usr/bin/memcached -m%(ENV_MEMCACHED_MEMORY)s" >> /etc/supervisor.d/memcached.ini && \
    echo "user=memcached" >> /etc/supervisor.d/memcached.ini

ENV MEMCACHED_MEMORY 64

EXPOSE 11211
