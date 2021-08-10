rc default
/etc/init.d/mariadb setup
service mariadb start
mysql -u root mysql < create_db.sql
mysql -u root wordpress < wordpress.sql
service mariadb stop
/usr/bin/mysqld_safe