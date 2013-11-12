FROM x3tech/arch

RUN pacman -Sy && \
    pacman -S --noconfirm supervisor && \
    pacman -Scc --noconfirm

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-n", "-c", "/etc/supervisord.conf"]
