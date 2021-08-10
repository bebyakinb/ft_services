FROM alpine

RUN apk update && apk upgrade
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
                    php7-zlib php7-curl php7-mbstring php7-json php7-session \
                	nginx php-fpm wget supervisor
RUN apk add nginx wget supervisor

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/supervisord.conf

RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages ./phpmyadmin

COPY config.inc.php ./phpmyadmin/config.inc.php

RUN mkdir -p run/nginx

EXPOSE 5000
CMD /usr/bin/supervisord -c /etc/supervisord.conf 