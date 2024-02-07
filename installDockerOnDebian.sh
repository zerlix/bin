#!/bin/bash

# Entferne, für eine saubere installation, alle installierten Docker pakete
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do
    sudo apt-get remove $pkg
done

# Füge den offiziellen GPG-Schlüssel von Docker hinzu
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Füge das Repository den Apt-Quellen hinzu"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# apt quellen aktualisieren
sudo apt-get update

# Docker Pakete installieren
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# Installation überprüfen
if sudo docker run hello-world; then
    echo "Die Docker-Installation war erfolgreich."
else
    echo "Es gab Probleme bei der Docker-Installation."
fi
