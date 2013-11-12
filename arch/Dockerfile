FROM base/arch

RUN echo "[x3tech]" >> /etc/pacman.conf && \
    echo "SigLevel = Never" >> /etc/pacman.conf && \
    echo "Server = http://repo.x3tech.com" >> /etc/pacman.conf && \
    pacman -Syu --noconfirm --ignore=filesystem && \
    pacman -Su --noconfirm --dbonly filesystem && \
    /usr/bin/ln -s /usr/bin /bin && \
    /usr/bin/ln -s /usr/sbin /sbin && \
    pacman -Scc --noconfirm
