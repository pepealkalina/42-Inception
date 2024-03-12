#FROM set the base image for the container, I'm using debian:bullseye because is more stable than apilne
FROM debian:bullseye

#RUN run a command inside the container while building
#the ppackage manager for debian is apt and we use this to install nginx
#install all the thinghs necessaries for wp and php
RUN apt update && apt upgrade && apt install -y wget \ 
        curl \
        bash \
        php \
        php-cgi \
        php-mysql \
        php-fpm \
        php-pdo \
        php-gd \
        php-cli \
        php-mbstring \
        redis \
        php-redis \
        && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

#copy the conf file in the html directory
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

#copy and run 
COPY ./tools/install_wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/install_wp.sh

WORKDIR /var/www/html/

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/install_wp.sh"]
    

