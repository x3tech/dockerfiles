FROM x3tech/arch
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm postgresql && \
    pacman -Scc --noconfirm

ADD postgres-wrapper.sh /opt/

EXPOSE 5432
USER postgres
VOLUME ["/var/lib/postgres/"]
CMD ["/opt/postgres-wrapper.sh"]
