FROM x3tech/arch-infra-base
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm redis && \
    pacman -Scc --noconfirm && \
    echo "[program:redis]" > /etc/supervisor.d/redis.ini && \
    echo "command=/usr/bin/redis-server" >> /etc/supervisor.d/redis.ini && \
    mkdir -p /opt/redis/{log,data}

ADD redis.conf /etc/redis.conf

EXPOSE 6379
VOLUME ["/opt/redis/"]
