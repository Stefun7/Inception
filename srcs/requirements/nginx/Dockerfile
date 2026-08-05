FROM debian:bookworm
# initialisation de l’image de base

RUN apt-get update && apt-get install nginx -y
# met à jour la liste des paquets disponibles
# -y répond automatiquement "yes" aux confirmations

RUN apt-get install openssl -y
RUN rm -rf /var/lib/apt/lists/*
# OpenSSL va nous servir à générer notre clé et certificat
# rm -rf supprime le cache inutile

RUN rm -f /etc/nginx/sites-enabled/default
RUN rm -f /etc/nginx/sites-available/default
# enlève les configurations par défaut de NGINX pour éviter les conflits

COPY conf/nginx.conf /etc/nginx/nginx.conf
# remplace la configuration standart de NGINX

COPY tools/setup_ssl.sh /setup.sh
RUN chmod +x /setup.sh
# updating (or creating) /setup.sh with our own configuration and giving permission

RUN chmod -R 755 /var/www/html
# Donne les droits en lecture/écriture/exécution pour le propriétaire, et lecture/exécution pour les autres
# sur tous les fichiers/dossiers du répertoire /var/www/html

RUN chown -R www-data:www-data /var/www/html
# Change le propriétaire des fichiers du dossier /var/www/html en 'www-data'
# (l'utilisateur utilisé par NGINX pour exécuter les processus web)

EXPOSE 443
# Déclare le port 443 comme exposé (HTTPS)
# Cela indique à Docker que ce port sera utilisé par le conteneur à l'exécution

ENTRYPOINT ["bash", "/setup.sh"]
# Utilise le script bash comme point d’entrée (entrypoint)