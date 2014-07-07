FROM stackbrew/ubuntu:13.10
MAINTAINER 3onyc

EXPOSE 10001 12001 8000 8082

ADD seafile-server_2.1.5_x86-64.tar.gz /opt/seafile/

ENV SERVER_NAME example
ENV SERVER_ADDR seafile.example.com
ENV ADMIN_EMAIL admin@example.com
ENV ADMIN_PASSWORD changeme!

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y python2.7-mysqldb python-setuptools python-simplejson python-imaging && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y sqlite3 && \
    apt-get clean && \
    mkdir -p /opt/seafile/data && \
    useradd -d /opt/seafile seafile && \
    chown -R seafile:seafile /opt/seafile && \
    chmod -R u+rwX,g+rX-w,o-rwx /opt/seafile && \
    chmod -R g+rX-w,og+rX /opt/seafile/seafile-server-*

VOLUME /opt/seafile

ADD scripts/run.sh /run.sh

CMD ["/run.sh"]
