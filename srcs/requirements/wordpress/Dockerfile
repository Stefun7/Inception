FROM debian:bookworm

RUN apt-get update && \
	apt-get install -y \
		php-fpm \
		php-mysql \
		mariadb-client \
		wget && \
	rm -rf /var/lib/apt/lists/*

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# Download wp-cli, rename it "wp" and put it in our docker bin file, then make it exexutable with chmod
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

# create root file
RUN mkdir -p /var/www/html

COPY tools/setup_wordpress.sh /setup.sh

RUN chmod +x /setup.sh

EXPOSE 9000

WORKDIR /var/www/html

ENTRYPOINT ["bash", "/setup.sh"]