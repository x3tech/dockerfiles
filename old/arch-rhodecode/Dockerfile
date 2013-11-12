FROM x3tech/arch-supervisord

RUN useradd -m -d /opt/rhodecode rhodecode && \
    su rhodecode -c 'mkdir -p /opt/rhodecode/repositories'

ADD production.ini /opt/rhodecode/production.ini

RUN pacman -Sy --noconfirm gcc python2 python2-pip python2-crypto python2-gevent git mercurial subversion && \
    pacman -Scc --noconfirm && \
    pip2 install https://rhodecode.com/dl/latest && \
    echo "[program:rhodecode]" > /etc/supervisor.d/rhodecode.ini && \
    echo "user=rhodecode" >> /etc/supervisor.d/rhodecode.ini && \
    echo "command=/usr/bin/paster serve /opt/rhodecode/production.ini" >> /etc/supervisor.d/rhodecode.ini && \
    su rhodecode -c 'paster setup-rhodecode /opt/rhodecode/production.ini \
      --force-yes \
      --user=admin \
      --password=changeme! \
      --email=admin@example.com \
      --repos=/opt/rhodecode/repositories'

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-n"]
