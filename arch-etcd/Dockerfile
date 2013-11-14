FROM x3tech/arch-infra-base
MAINTAINER 3onyc

RUN pacman -Sy && \
    pacman -S --noconfirm etcd && \
    pacman -Scc --noconfirm && \
    echo "[program:etcd]" > /etc/supervisor.d/etcd.ini && \
    echo "command=/opt/start-etcd.sh" >> /etc/supervisor.d/etcd.ini

ENV ETCD_MASTER_ADDR 172.17.42.1:7001
ADD start-etcd.sh /opt/
