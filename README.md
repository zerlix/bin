## wol.ps1
Das Skript sendet ein sogenanntes "Magic Packet" an eine bestimmte MAC-Adresse. Ein Magic Packet ist ein spezielles Netzwerkpaket, das an Wake-on-LAN (WoL) unterstützten Geräten gesendet wird, um sie aus dem Ruhezustand zu wecken.

##  installDockerOnDebian.sh
Die vorliegende Bash-Skriptdatei automatisiert die Installation von Docker und Portainer auf einem Debian-System. Es beginnt damit, alle vorhandenen Docker-Pakete zu entfernen, fügt dann den offiziellen GPG-Schlüssel von Docker hinzu, aktualisiert die Apt-Quellen und installiert Docker-Pakete. Anschließend wird die erfolgreiche Docker-Installation überprüft.

Danach wird Portainer installiert. Das Skript prüft, ob das benötigte Volume vorhanden ist, und startet dann einen Portainer-Container, falls noch keiner vorhanden ist. Es überprüft auch den Erfolg der Portainer-Installation und gibt die entsprechenden Informationen aus, einschließlich der URL, unter der Portainer erreichbar ist.

Eine kurze Beschreibung für eine README-Datei könnte folgendermaßen lauten:

**Automatisierte Docker- und Portainer-Installation für Debian**

Dieses Bash-Skript automatisiert die Installation von Docker und Portainer auf einem Debian-System. Es entfernt zunächst vorhandene Docker-Pakete, fügt dann den offiziellen GPG-Schlüssel von Docker hinzu, aktualisiert die Apt-Quellen und installiert die erforderlichen Docker-Pakete. Anschließend wird Portainer installiert und gestartet. Das Skript überprüft den Erfolg der Installationen und gibt die entsprechenden URLs aus, um auf Portainer zuzugreifen.

**Verwendung:**

1. Führen Sie das Skript auf einem Debian-System mit ausreichenden Berechtigungen aus.
2. Befolgen Sie die Ausgabe, um auf Portainer zuzugreifen und die erfolgreiche Installation zu überprüfen.

**Hinweis:**

Dieses Skript wurde für die Verwendung auf Debian-Systemen entwickelt und kann auf anderen Linux-Distributionen möglicherweise nicht ordnungsgemäß funktionieren. Bitte stellen Sie sicher, dass Sie über ausreichende Berechtigungen und Kenntnisse verfügen, um Systemänderungen vorzunehmen, bevor Sie das Skript ausführen.
