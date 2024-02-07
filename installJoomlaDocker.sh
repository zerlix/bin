#/bin/bash

ROOT_PWD = rootpwd
DB_USER = joomla
DB_PWD = passwort

# Erstelle ein Netzwerk in Docker
docker network create joomla-network

# Mysql installieren und konfigurieren
docker pull mysql:latest
docker volume create mysql-data

docker run -d --name joomladb  \
    -v mysql-data:/var/lib/mysql \
    --network joomla-network -e "MYSQL_ROOT_PASSWORD=$ROOT_PWD" -e MYSQL_USER=$DB_USER -e "MYSQL_PASSWORD=$DB_PWD" -e "MYSQL_DATABASE=joomla" mysql:latest



#docker pull joomla:latest


