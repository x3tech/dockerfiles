FROM x3tech/arch-infra-base
MAINTAINER 3onyc

RUN pacman -Sy && \
    pacman -S --noconfirm etcd && \
    pacman -Scc --noconfirm && \
    echo "[program:etcd]" > /etc/supervisor.d/etcd.ini && \
    echo "command=/opt/start-etcd.sh" >> /etc/supervisor.d/etcd.ini

EXPOSE 4001 7001
ADD start-etcd.sh /opt/
