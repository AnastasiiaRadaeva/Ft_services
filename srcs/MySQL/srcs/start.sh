openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root mysql < mysql_conf.sql
mysql -u root kbatwoma < kbatwoma.sql
rc-service mariadb stop
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'