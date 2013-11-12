FROM x3tech/arch-nodejs

RUN pacman -Sy --noconfirm redis git python2-pip && \
    pacman -Scc --noconfirm && \ 
    npm install -g hipache && \
    pip2 install git+https://github.com/x3tech/etcd-py.git@EtcdWatch-prevValue requests redis && \
    echo "[program:redis]" > /etc/supervisor.d/redis.ini && \
    echo "command=/usr/bin/redis-server" >> /etc/supervisor.d/redis.ini && \
    echo "[program:hipache]" > /etc/supervisor.d/hipache.ini && \
    echo "command=/usr/bin/hipache -c /etc/hipache.conf" >> /etc/supervisor.d/hipache.ini && \
    echo "[program:hipache-updater]" > /etc/supervisor.d/hipache-updater.ini && \
    echo "command=/usr/bin/python2 -u /opt/hipache-update.py" >> /etc/supervisor.d/hipache-updater.ini

ADD hipache.conf /etc/hipache.conf
ADD 01_create_cert.sh /opt/init.d/
ADD hipache-update.py /opt/hipache-update.py
