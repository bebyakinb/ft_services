FROM alpine

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/supervisord.conf
COPY sshd_config /etc/ssh/
RUN chmod 744 /etc/ssh/sshd_config

RUN adduser -D enoelia
RUN echo "enoelia:pass"|chpasswd
RUN ssh-keygen -A

RUN mkdir -p run/nginx

RUN mkdir -p ./etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 14 -nodes -out \
		/etc/nginx/ssl/site.pem -keyout /etc/nginx/ssl/site.key -subj \
		"/C=RU/ST=Moscow/L=Moscow/O=21 School/OU=enoelia/CN=site"

EXPOSE 80 443 22
CMD /usr/bin/supervisord -c /etc/supervisord.conf