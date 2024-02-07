## Sendet ein Magic Packet an eine bestimmte MAC-Adresse 


# Mac-Adresse
$macAddress = "88D7F678891C"


try {
    # Broadcast-Adresse des Netzwerks ermitteln
    $broadcast = [System.Net.IPAddress]::Broadcast

    # UDP-Client erstellen
    $udpClient = New-Object Net.Sockets.UdpClient

    # Endpunkt für den Port 7 erstellen (Standardport für Wake-on-LAN)
    $ipEndPoint = New-Object Net.IPEndPoint $broadcast, 7

    # MAC-Adresse in ein Byte-Array umwandeln
    $mac = [Net.NetworkInformation.PhysicalAddress]::Parse($macAddress.ToUpper())

    # Magic Packet konstruieren
    $mpacket = [Byte[]](, 0xFF * 6) + ($mac.GetAddressBytes() * 16)

    # Magic Packet über UDP an den Endpunkt senden
    $udpClient.Send($mpacket, $mpacket.Length, $ipEndPoint) | Out-Null
    $udpClient.Close()
        
    Write-Host "Magic Packet erfolgreich an MAC-Adresse $macAddress gesendet."
}
catch {
    Write-Error "Fehler beim Senden des Magic Packets an MAC-Adresse  $macAddress"
}
    
