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

# Crée le dossier racine pour WordPress
RUN mkdir -p /var/www/html

# Copie le script d’installation de WordPress
COPY tools/setup_wordpress.sh /setup.sh

# Rend le script exécutable
RUN chmod +x /setup.sh

# Déclare le port 9000 utilisé par PHP-FPM
EXPOSE 9000

# Définit le répertoire de travail par défaut.
# Important pour que notre script install wordpress au bon endroit
WORKDIR /var/www/html

# Lance l’installation automatique à l’exécution du container
ENTRYPOINT ["bash", "/setup.sh"]