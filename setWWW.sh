#!/bin/bash
set -v

# Benutzer und Gruppe definieren
USER="www-data"
GROUP="www-data"

# Zielverzeichnis
TARGET_DIR="/mnt/raid/var/www"

# Standard-ACLs für neue Dateien und Verzeichnisse setzen
setfacl -R -m d:u:$USER:rwX,d:g:$GROUP:rwX $TARGET_DIR

# Existierende Verzeichnisse: rwx für Benutzer und Gruppe setzen
find $TARGET_DIR -type d -exec chmod 770 {} \;
find $TARGET_DIR -type d -exec chown $USER:$GROUP {} \;

# Existierende Dateien: rw- für Benutzer und Gruppe setzen
find $TARGET_DIR -type f -exec chmod 660 {} \;
find $TARGET_DIR -type f -exec chown $USER:$GROUP {} \;

# Setgid-Flag setzen, damit neue Dateien die Gruppe des Verzeichnisses übernehmen
chmod g+s $TARGET_DIR

echo "Rechte und ACLs für $TARGET_DIR wurden erfolgreich gesetzt."
