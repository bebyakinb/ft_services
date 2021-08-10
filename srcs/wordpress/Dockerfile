FROM alpine

RUN apk update && apk upgrade
RUN apk add nginx wget supervisor php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/supervisord.conf

RUN wget https://wordpress.org/latest.tar.gz
RUN tar zxvf latest.tar.gz
RUN rm latest.tar.gz

COPY wp-config.php /wordpress/
RUN mkdir -p run/nginx

EXPOSE 5050
CMD /usr/bin/supervisord -c /etc/supervisord.conf 