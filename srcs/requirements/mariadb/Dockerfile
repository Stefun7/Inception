FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y
RUN rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/setup_mariadb.sh /setup.sh
RUN chmod +x /setup.sh
ENTRYPOINT ["bash", "/setup.sh"]
# not a problem, becasue when exec is executed, bash disapears and is replaced by nginx