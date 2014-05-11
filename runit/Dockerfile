FROM ubuntu:14.04
MAINTAINER 3onyc

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y runit && \
    apt-get clean

CMD ["/usr/sbin/runsvdir-start"]
