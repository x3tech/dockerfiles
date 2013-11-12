FROM x3tech/arch-nginx

RUN pacman -Sy --noconfirm postgresql php-pgsql && \
    pacman -Scc --noconfirm && \
    chown postgres:postgres /var/lib/postgres/ && \
    su postgres -c "/usr/bin/initdb -D /var/lib/postgres/data/ -E 'UTF-8' --lc-collate='en_US.UTF-8' --lc-ctype='en_US.UTF-8'" && \
    echo "[program:pgsql]" > /etc/supervisor.d/pgsql.ini && \
    echo "user=postgres" >> /etc/supervisor.d/pgsql.ini && \
    echo "command=postmaster -D /var/lib/postgres/data/" >> /etc/supervisor.d/pgsql.ini

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-n"]
