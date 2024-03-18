#!/bin/sh

mysql_install_db

service mysql start

#Check if the database exists

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 

	echo "Database already exists"
else

# Set root option so that connexion without root password is not possible

mysql_secure_installation <<_EOF_

Y
root1234
root1234
Y
n
Y
Y
_EOF_

#Add a root user on 127.0.0.1 to allow remote connexion

	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Create database and user for wordpress
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

#Import database
mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /wpdatabase.sql

fi

service mysql stop

sudo usermod -d /var/lib/mysql/ mysql

service mysql start