FROM base/arch
MAINTAINER 3onyc

RUN pacman -Syu --noconfirm --ignore=filesystem && \
    pacman -Su --noconfirm --dbonly filesystem && \
    /usr/bin/ln -s /usr/bin /bin && \
    /usr/bin/ln -s /usr/sbin /sbin && \
    pacman -Scc --noconfirm
