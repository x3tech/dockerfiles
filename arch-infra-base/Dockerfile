FROM x3tech/arch-supervisord
MAINTAINER 3onyc

RUN echo "[x3tech]" >> /etc/pacman.conf && \
    echo "SigLevel = Never" >> /etc/pacman.conf && \
    echo "Server = http://repo.x3tech.com" >> /etc/pacman.conf && \
    mkdir /opt/init.d

ADD init.py /init.py

VOLUME ["/var/log"]
ENTRYPOINT ["/usr/bin/python2"]
CMD ["-u", "/init.py"]
