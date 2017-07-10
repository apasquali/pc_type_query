# Title:     Checks Operating system type and only outputs PCs.
# Author:    Alan Pasquali
# Date:      03/1/2013

$ips = IMport-Csv -Path C:\Users\Administrator\Desktop\scripts\pctowyse\IP.csv -UseCulture

$ips | % {

    $remotecomputer = $_.IPAddress
    
    $result = Get-WmiObject Win32_OperatingSystem -computer $remotecomputer
    $result = $result.Organization
    
    if ($result -ne "Wyse Technology"){
    $output = @("$result : $remotecomputer")
    $output
    }
}
