FROM x3tech/arch-web-base

RUN pacman -Sy --noconfirm nginx && \
    pacman -Scc --noconfirm && \
    echo "[program:nginx]" > /etc/supervisor.d/nginx.ini && \
    echo "command=/usr/bin/nginx" >> /etc/supervisor.d/nginx.ini

ENV WEB_PORT 80

ADD nginx.conf /etc/nginx/nginx.conf
