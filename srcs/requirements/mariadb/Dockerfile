FROM debian:bullseye

RUN apt-get update && apt-get -y install mariadb-server mariadb-client \
&& rm -rf /var/lib/apt/lists/* \
# purge and re-create /var/lib/mysql with appropriate ownership
&& mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
&& chmod 777 /var/run/mysqld

#COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/init.sh /
COPY ./conf/wpdatabase.sql /

RUN chmod +x /wpdatabase.sql

RUN chmod +x /init.sh

EXPOSE 3306

ENTRYPOINT ["/init.sh"]
#Command to launch mariadb and enable the database to listen globally
CMD ["mysqld", "--bind-address=0.0.0.0"]
