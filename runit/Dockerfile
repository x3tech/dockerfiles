FROM ubuntu:14.04
MAINTAINER 3onyc

RUN apt-get update && \
    apt-get install -y runit && \
    apt-get clean

CMD ["/usr/sbin/runsvdir-start"]
