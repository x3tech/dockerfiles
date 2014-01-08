FROM x3tech/arch-infra-base
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm znc && \
    pacman -Scc --noconfirm && \
    echo "[program:znc]" > /etc/supervisor.d/znc.ini && \
    echo "user=znc" >> /etc/supervisor.d/znc.ini && \
    echo "command=/usr/bin/znc -d /var/lib/znc/ -f" >> /etc/supervisor.d/znc.ini

ADD 30_znc_init.sh /opt/init.d/

EXPOSE 6697

ENV ZNC_ADMIN_USER admin
ENV ZNC_ADMIN_PASS changeme!

VOLUME ["/var/lib/znc/"]
