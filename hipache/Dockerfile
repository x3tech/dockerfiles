FROM x3tech/arch-nodejs
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm redis git python2-pip && \
    pacman -Scc --noconfirm && \ 
    npm install -g hipache && \
    pip2 install git+https://github.com/transitorykris/etcd-py.git requests redis && \
    echo "[program:hipache]" > /etc/supervisor.d/hipache.ini && \
    echo "command=/usr/bin/hipache -c /etc/hipache.conf" >> /etc/supervisor.d/hipache.ini && \
    echo "[program:hipache-updater]" > /etc/supervisor.d/hipache-updater.ini && \
    echo "command=/usr/bin/python2 -u /opt/hipache-update.py" >> /etc/supervisor.d/hipache-updater.ini

ADD hipache.conf /etc/hipache.conf.tpl
ADD 01_create_cert.sh /opt/init.d/
ADD 02_gen_hipache_conf.sh /opt/init.d/
ADD hipache-update.py /opt/hipache-update.py
