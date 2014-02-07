FROM x3tech/arch
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm nginx && pacman -Scc --noconfirm

EXPOSE 80
VOLUME ["/srv/http"]

ADD run.sh /run.sh
ADD index.html /srv/http/index.html
ADD nginx.conf /etc/nginx/nginx.conf

CMD ["/run.sh"]
