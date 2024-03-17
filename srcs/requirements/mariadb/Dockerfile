FROM debian:bullseye

RUN apt update && apt upgrade -y &&apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init.sh /

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /init.sh 

RUN service mariadb start

EXPOSE 3306

CMD ["/init.sh"]
