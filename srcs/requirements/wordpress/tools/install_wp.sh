#!/bin/bash

#check if wp-config.php exists
if [ -f ./wp-config.php]
then
    echo "wordpress already downladed"
else


## Download and config wordpress

wget http://wordpress.org/latest.tar.gz #download wp
tar xfz latest.tar.gz #decompress the file downloaded
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress
##import env variables in conf file
fi

/usr/sbin/php-fpm7.3 -F
