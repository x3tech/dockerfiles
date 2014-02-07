FROM x3tech/arch-base
MAINTAINER 3onyc

RUN pacman -Sy --noconfirm memcached && pacman -Scc --noconfirm

ADD run.sh /run.sh

ENV MEMCACHED_MEMORY 64
ENV MEMCACHED_THREADS 4

EXPOSE 11211
USER memcached
CMD ["/run.sh"]
