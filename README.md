##  installDockerOnDebian.sh
**Automatisierte Docker- und Portainer-Installation für Debian**

Dieses Bash-Skript automatisiert die Installation von Docker und Portainer auf einem Debian-System. Es entfernt zunächst vorhandene Docker-Pakete, fügt dann den offiziellen GPG-Schlüssel von Docker hinzu, aktualisiert die Apt-Quellen und installiert die erforderlichen Docker-Pakete. Anschließend wird Portainer installiert und gestartet. Das Skript überprüft den Erfolg der Installationen und gibt die entsprechenden URLs aus, um auf Portainer zuzugreifen.

**Verwendung:**

1. Führen Sie das Skript auf einem Debian-System mit ausreichenden Berechtigungen aus.
2. Befolgen Sie die Ausgabe, um auf Portainer zuzugreifen und die erfolgreiche Installation zu überprüfen.

**Hinweis:**

Dieses Skript wurde für die Verwendung auf Debian-Systemen entwickelt und kann auf anderen Linux-Distributionen möglicherweise nicht ordnungsgemäß funktionieren. Bitte stellen Sie sicher, dass Sie über ausreichende Berechtigungen und Kenntnisse verfügen, um Systemänderungen vorzunehmen, bevor Sie das Skript ausführen.

## wol.ps1
**Sendet ein Magic Packet an eine bestimmte MAC-Adresse**

Dieses PowerShell-Skript sendet ein sogenanntes "Magic Packet" an eine spezifizierte MAC-Adresse, um ein Gerät über das Netzwerk zu aktivieren (z. B. für Wake-on-LAN).

**Verwendung:**

1. Ersetzen Sie den Wert der Variablen `$macAddress` durch die MAC-Adresse des Zielsystems, an das das Magic Packet gesendet werden soll.
```powershell
$macAddress = "88D7F678891C"
```
2. Führen Sie das Skript in einer PowerShell-Umgebung mit ausreichenden Berechtigungen aus.

**Ausgabe:**

Das Skript gibt eine Erfolgsmeldung aus, wenn das Magic Packet erfolgreich an die angegebene MAC-Adresse gesendet wurde. Im Fehlerfall wird eine entsprechende Fehlermeldung ausgegeben.

**Hinweis:**

- Stellen Sie sicher, dass das Zielsystem und das sendende System im selben Netzwerksegment oder über Routing erreichbar sind.
- Überprüfen Sie die Firewall-Einstellungen, um sicherzustellen, dass UDP-Pakete auf Port 7 zugelassen sind, falls erforderlich.
- Dieses Skript funktioniert nur unter Windows, da es PowerShell verwendet.
