FROM x3tech/arch-web-base
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm nginx && \
    pacman -Scc --noconfirm && \
    echo "[program:nginx]" > /etc/supervisor.d/nginx.ini && \
    echo "command=/usr/bin/nginx" >> /etc/supervisor.d/nginx.ini

ENV WEB_PORT 80
EXPOSE 80

VOLUME ["/srv/http/"]

ADD nginx.conf /etc/nginx/nginx.conf
ADD 30_nginx.py /opt/init.d/30_nginx.py
