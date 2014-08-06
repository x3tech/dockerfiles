FROM stackbrew/ubuntu:14.04
MAINTAINER 3onyc

EXPOSE 10001 12001 8000 8082

ENV SEAFILE_VERSION 3.1.1
ENV SERVER_NAME example
ENV SERVER_ADDR seafile.example.com
ENV ADMIN_EMAIL admin@example.com
ENV ADMIN_PASSWORD changeme!

ADD seafile-server_3.1.1_x86-64.tar.gz /opt/seafile/

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

ADD scripts/setup-seafile.sh /opt/seafile/seafile-server-3.1.1/setup-seafile.sh
ADD scripts/check_init_admin.py /opt/seafile/seafile-server-3.1.1/check_init_admin.py
ADD scripts/run.sh /run.sh

VOLUME /opt/seafile/data

CMD ["/run.sh"]
