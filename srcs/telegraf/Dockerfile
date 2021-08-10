FROM alpine

RUN apk update && apk upgrade
RUN apk add wget

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_static_linux_amd64.tar.gz
RUN tar xf ./telegraf-1.16.1_static_linux_amd64.tar.gz
RUN cp -r ./telegraf-1.16.1/* /
RUN rm -fr telegraf-1.16.1 telegraf-1.16.1_static_linux_amd64.tar.gz

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk

COPY 	telegraf.conf /etc/telegraf/

CMD 	[ "telegraf" ]