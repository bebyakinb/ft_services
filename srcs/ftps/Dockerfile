FROM alpine

RUN apk update && apk upgrade
RUN apk add vsftpd openssl openrc

RUN adduser -D -h /var/ftp enoelia
RUN echo "enoelia:pass" | chpasswd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p ./etc/vsftpd/ssl

RUN mkdir -p ./etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 14 -nodes -out \
		/etc/nginx/ssl/site.pem -keyout /etc/nginx/ssl/site.key -subj \
		"/C=RU/ST=Moscow/L=Moscow/O=21 School/OU=enoelia/CN=site"
	
COPY start.sh .
RUN chmod u+x start.sh

EXPOSE 20 21 44000

CMD [ "sh", "start.sh"  ]

