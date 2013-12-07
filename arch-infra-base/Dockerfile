FROM x3tech/arch-supervisord
MAINTAINER 3onyc

RUN mkdir /opt/init.d
ADD init.py /init.py

ENTRYPOINT ["/usr/bin/python2"]
CMD ["-u", "/init.py"]
