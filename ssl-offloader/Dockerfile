FROM x3tech/nginx
MAINTAINER 3onyc

ADD http://repo.x3tech.com/deb/go-envtpl_1.0_amd64.deb /tmp/go-envtpl_1.0_amd64.deb

RUN dpkg -i /tmp/go-envtpl_1.0_amd64.deb && \
    rm /tmp/go-envtpl_1.0_amd64.deb && \
    rm /var/www/index.html

ENV NGINX_WORKERS 4
ENV SSL_CERT_PATH /opt/ssl/cert.pem
ENV SSL_CERT_KEY_PATH /opt/ssl/key.pem
ENV SSL_DH_PARAM /opt/ssl/dh.pem
ENV UPSTREAM_IP 127.0.0.1
ENV UPSTREAM_PORT 80

ADD nginx.conf.tpl /etc/nginx/nginx.conf.tpl
ADD run.sh /run.sh

CMD [ "/run.sh" ]
