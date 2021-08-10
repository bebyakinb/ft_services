FROM alpine

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client openrc

RUN mkdir src
COPY my.cnf /etc/mysql/
COPY start_mariadb.sh .
COPY create_db.sql .
COPY wordpress.sql .

EXPOSE 3306

CMD	["sh", "start_mariadb.sh"]