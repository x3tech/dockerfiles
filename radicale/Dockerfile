FROM x3tech/base
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm python-psycopg2 python-pip && \
    pacman -Scc --noconfirm && \
    pip install radicale && \
    mkdir /opt/radicale && \
    chown http:http /opt/radicale

ADD radicale.conf /etc/radicale/config

EXPOSE 80

CMD ["/usr/bin/radicale"]
