#!/bin/bash
#
# Web-Verzeichnis Berechtigungen (setMode_www.sh)
#
# Dieses Skript setzt automatisch die korrekten Berechtigungen für das `/var/www` Verzeichnis,
# inklusive ACLs für den Webserver-Benutzer (www-data).

# Benutzer und Gruppe definieren
USER="www-data"
GROUP="www-data"
TARGET_DIR="/var/www"

# Prüfen ob Script als root ausgeführt wird
if [ "$EUID" -ne 0 ]; then
    echo "Bitte führen Sie das Skript als root aus (sudo)."
    exit 1
fi

# Prüfen ob ACL-Tools installiert sind
if ! command -v setfacl &> /dev/null || ! command -v getfacl &> /dev/null; then
    echo "ACL-Tools nicht gefunden. Bitte installieren Sie acl: sudo apt-get install acl"
    exit 1
fi

# Prüfen ob Verzeichnis existiert
if [ ! -d "$TARGET_DIR" ]; then
    echo "Zielverzeichnis $TARGET_DIR existiert nicht!"
    exit 1
fi

echo "Setze Berechtigungen für $TARGET_DIR..."

# Basis-Verzeichnis Berechtigungen setzen
chmod 2775 "$TARGET_DIR"

# Standard-ACLs für neue Verzeichnisse und Dateien setzen
echo "Setze Standard-ACLs..."
setfacl -R -b "$TARGET_DIR" # Bestehende ACLs zurücksetzen
setfacl -d -m u::rwx,g::rwx,o::rx "$TARGET_DIR"
setfacl -d -m u:$USER:rwx,g:$GROUP:rwx "$TARGET_DIR"

# Bestehende Verzeichnisse und Dateien anpassen
echo "Passe bestehende Dateien und Verzeichnisse an..."
find "$TARGET_DIR" -type d -exec bash -c '
    setfacl -m u::rwx,g::rwx,o::rx,u:'$USER':rwx,g:'$GROUP':rwx "$1"
    chmod 2775 "$1"
' bash {} \;

find "$TARGET_DIR" -type f -exec bash -c '
    setfacl -m u::rw-,g::rw-,o::r--,u:'$USER':rw-,g:'$GROUP':rw- "$1"
    chmod 0664 "$1"
' bash {} \;

# Ergebnis überprüfen
echo -e "\nAktuelle Berechtigungen für $TARGET_DIR:"
getfacl "$TARGET_DIR"

echo -e "\nBerechtigung für eine Beispieldatei (falls vorhanden):"
find "$TARGET_DIR" -type f -print -quit | xargs -r getfacl

echo -e "\nSkript wurde erfolgreich ausgeführt!"
