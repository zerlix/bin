## wol.ps1
Das Skript sendet ein sogenanntes "Magic Packet" an eine bestimmte MAC-Adresse. Ein Magic Packet ist ein spezielles Netzwerkpaket, das an Wake-on-LAN (WoL) unterstützten Geräten gesendet wird, um sie aus dem Ruhezustand zu wecken.

##  installDockerOnDebian.sh
Dieses Bash-Skript ist für die Installation von Docker auf einem Debian-basierten System gedacht. Hier ist eine kurze Beschreibung:

    Entfernt alle vorhandenen Docker-Pakete für eine saubere Installation.
    Fügt den offiziellen GPG-Schlüssel von Docker hinzu.
    Fügt das Docker-Repository zu den Apt-Quellen hinzu.
    Aktualisiert die Apt-Quellen.
    Installiert die erforderlichen Docker-Pakete.
    Überprüft die Installation durch Ausführen des Befehls docker run hello-world.

Das Skript führt diese Schritte nacheinander aus und gibt am Ende eine Erfolgsmeldung oder eine Fehlermeldung aus.
