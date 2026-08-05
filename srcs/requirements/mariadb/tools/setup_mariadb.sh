#!/bin/bash

echo "🚀 Démarrage de l'initialisation de MariaDB..."

if [ -z "$SQL_ROOT_PASSWORD" ] || [ -z "$SQL_DATABASE" ] || [ -z "$SQL_USER" ] || [ -z "$SQL_PASSWORD" ]; then
    echo "❌ Variables d'environnement requises manquantes."
    exit 1
fi

service mariadb start

echo "🔗 Connexion à la base de données..."

MAX_RETRIES=30
COUNT=0
while [ $COUNT -lt $MAX_RETRIES ]; do
		if mysqladmin ping -h"localhost" --silent; then
				echo "✅ Connexion à la base de données établie !"
				break
		fi
		echo "🔄 En attente que MariaDB soit prêt... Tentative $((COUNT + 1))/$MAX_RETRIES"
		sleep 2
		COUNT=$((COUNT + 1))
done

if [ $COUNT -eq $MAX_RETRIES ]; then
		echo "❌ Échec de la connexion à la base de données après $MAX_RETRIES tentatives."
		exit 1
fi

echo "✅ MariaDB est prêt. Création de la base de données et des utilisateurs..."

# root psw here, depending on the machine can be little "childish"
mysql -u root << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

# root for next connexion
mysql -u root -p"${SQL_ROOT_PASSWORD}" << EOF
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo "🎉 Configuration de la base de données terminée avec succès !"

echo "🔥 Démarrage de MariaDB en avant-plan..."
mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

sleep 2

exec mysqld_safe