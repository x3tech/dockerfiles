FROM stackbrew/ubuntu:13.10
MAINTAINER 3onyc

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y memcached && \
    apt-get clean

ADD run.sh /run.sh

ENV MEMCACHED_MEMORY 64
ENV MEMCACHED_THREADS 4

EXPOSE 11211
USER memcache
CMD ["/run.sh"]
