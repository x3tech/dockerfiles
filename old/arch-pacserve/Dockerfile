FROM x3tech/arch-supervisord

RUN echo "[x3tech]" >> /etc/pacman.conf && \
    echo "SigLevel = Never" >> /etc/pacman.conf && \
    echo "Server = http://repo.x3tech.com/" >> /etc/pacman.conf && \
    pacman -Sy --noconfirm python pacserve && \
    pacman -Scc --noconfirm && \
    echo "[program:pacserve]" > /etc/supervisor.d/pacserve.ini && \
    echo "command=/usr/bin/pacserve /srv/http/" >> /etc/supervisor.d/pacserve.ini

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-n"]
