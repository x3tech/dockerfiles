FROM x3tech/arch-supervisord
MAINTAINER 3onyc

RUN mkdir /opt/init.d
ADD init.py /init.py
ADD 00_ip.sh /opt/init.d/
ADD 00_banner.sh /opt/init.d/

ENV ETCD_ADDR 172.17.42.1:4001

ENTRYPOINT ["/usr/bin/python2"]
CMD ["-u", "/init.py"]
