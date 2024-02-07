## Sendet ein Magic Packet an eine bestimmte MAC-Adresse 


# Mac-Adresse
$MacAddress = "88D7F678891C"


try {
    # Broadcast-Adresse des Netzwerks ermitteln
    $Broadcast = [System.Net.IPAddress]::Broadcast

    # UDP-Client erstellen
    $UdpClient = New-Object Net.Sockets.UdpClient

    # Endpunkt für den Port 7 erstellen (Standardport für Wake-on-LAN)
    $IPEndPoint = New-Object Net.IPEndPoint $Broadcast, 7

    # MAC-Adresse in ein Byte-Array umwandeln
    $MAC = [Net.NetworkInformation.PhysicalAddress]::Parse($MacAddress.ToUpper())

    # Magic Packet konstruieren
    $Packet = [Byte[]](, 0xFF * 6) + ($MAC.GetAddressBytes() * 16)

    # Magic Packet über UDP an den Endpunkt senden
    $UdpClient.Send($Packet, $Packet.Length, $IPEndPoint) | Out-Null
    $UdpClient.Close()
        
    Write-Host "Magic Packet erfolgreich an MAC-Adresse $MacAddress gesendet."
}
catch {
    Write-Error "Fehler beim Senden des Magic Packets an MAC-Adresse  $MacAddress"
}
    
