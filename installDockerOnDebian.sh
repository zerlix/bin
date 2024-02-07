#!/bin/bash

# Ermittle die IP-Adresse des Systems
ip_address=$(hostname -I | awk '{print $1}')


# Entferne, für eine saubere installation, alle installierten Docker pakete
echo -e "Es werden alle installierten Docker pakete entfernt...."
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin; do
    apt-get remove -y $pkg
done

# Füge den offiziellen GPG-Schlüssel von Docker hinzu
echo -e "\e[32mFüge GPG-Schlüssel hinzu...\e[0m"
apt-get update
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Füge das Repository den Apt-Quellen hinzu"
echo -e "\e[32mFüge Apt Quellen hinzu....\e[0m"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# apt quellen aktualisieren
echo -e "\e[32mApt Quellen aktualisieren...\e[0m"
apt-get update

# Docker Pakete installieren
echo -e "\e[32mDocker wird installiert...\e[0m"
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# Installation überprüfen
if docker run hello-world; then
    echo -e "\e[32mDie Docker-Installation war erfolgreich.\e[0m"
else
    echo -e "\e[31mEs gab Probleme bei der Docker-Installation.\e[0m"
    exit 1
fi


# Portainer installieren
echo -e "\e[32mPortainer wird installiert...\e[0m"

# Überprüfe, ob das Volume bereits existiert
if docker volume ls | grep -q portainer_data; then
    echo -e "\e[33mDas Volume 'portainer_data' existiert bereits.\e[0m"
else
    echo -e "\e[32mDas Volume 'portainer_data' wird erstellt...\e[0m"
    docker volume create portainer_data
fi

# Überprüfe, ob ein Docker-Container mit dem Namen "portainer" bereits existiert
if docker ps -a --format '{{.Names}}' | grep -q '^portainer$'; then
    echo -e "\e[33mEin Docker-Container mit dem Namen 'portainer' existiert bereits.\e[0m"
else
    echo -e "\e[32mDer Docker-Container 'portainer' wird gestartet...\e[0m"
    docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
fi


if [ $? -eq 0 ]; then
    echo -e "\e[32mPortainer wurde erfolgreich installiert und ist jetzt unter \e[34mhttps://$ip_address:9443\e[0m \e[32mzu erreichen.\e[0m"
else
    echo -e "\e[31mEs gab Probleme bei der Portainer-Installation.\e[0m"
    exit 1
fi




