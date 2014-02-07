FROM x3tech/arch
MAINTAINER 3onyc

RUN echo "[x3tech]" >> /etc/pacman.conf && \
    echo "SigLevel = Never" >> /etc/pacman.conf && \
    echo "Server = http://repo.x3tech.com" >> /etc/pacman.conf && \
    pacman -Sy && \
    pacman -S --noconfirm rsync wget-lua python2-pip python2-simplejson git && \
    pacman -Scc --noconfirm && \
    pip2 install seesaw && \
    useradd --system --user-group --shell /bin/bash archiveteam && \
    ln -s /bin/python2 /bin/python

ADD init.sh /init.sh

ENTRYPOINT ["/bin/bash"]
CMD ["/init.sh"]
