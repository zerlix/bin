## wol.ps1
Das Skript sendet ein sogenanntes "Magic Packet" an eine bestimmte MAC-Adresse. Ein Magic Packet ist ein spezielles Netzwerkpaket, das an Wake-on-LAN (WoL) unterstützten Geräten gesendet wird, um sie aus dem Ruhezustand zu wecken.

##  installDockerOnDebian.sh
**Automatisierte Docker- und Portainer-Installation für Debian**

Dieses Bash-Skript automatisiert die Installation von Docker und Portainer auf einem Debian-System. Es entfernt zunächst vorhandene Docker-Pakete, fügt dann den offiziellen GPG-Schlüssel von Docker hinzu, aktualisiert die Apt-Quellen und installiert die erforderlichen Docker-Pakete. Anschließend wird Portainer installiert und gestartet. Das Skript überprüft den Erfolg der Installationen und gibt die entsprechenden URLs aus, um auf Portainer zuzugreifen.

**Verwendung:**

1. Führen Sie das Skript auf einem Debian-System mit ausreichenden Berechtigungen aus.
2. Befolgen Sie die Ausgabe, um auf Portainer zuzugreifen und die erfolgreiche Installation zu überprüfen.

**Hinweis:**

Dieses Skript wurde für die Verwendung auf Debian-Systemen entwickelt und kann auf anderen Linux-Distributionen möglicherweise nicht ordnungsgemäß funktionieren. Bitte stellen Sie sicher, dass Sie über ausreichende Berechtigungen und Kenntnisse verfügen, um Systemänderungen vorzunehmen, bevor Sie das Skript ausführen.
