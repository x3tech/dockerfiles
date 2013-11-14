FROM x3tech/arch-nginx
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm uwsgi uwsgi-plugin-php && \
    pacman -Scc --noconfirm && \
    echo "[program:uwsgi]" > /etc/supervisor.d/uwsgi.ini && \
    echo "command=/usr/bin/uwsgi --ini /etc/uwsgi.ini" >> /etc/supervisor.d/uwsgi.ini

ADD nginx.conf /etc/nginx/nginx.conf
ADD uwsgi.ini /etc/uwsgi.ini
