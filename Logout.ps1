Import-Module PSTerminalServices
#Gets all workstations that need to have software installed, if you don't want to uninstall all of the software from you will need to use a text document and Get-Content
$Computers = Get-ADComputer -Filter * -SearchBase "OU=DServers,DC=CONTOSO,DC=COM" | Select DNSHostName -ExpandProperty DNSHostname

#Set user you would like to logoff
$User = 'username'

#Gets computers to run on from text file
#$Computers = Get-Content '\\FilesPath\'
foreach ($Computer in $Computers) 
{
Get-TSSession -ComputerName $Computer -UserName $User -ErrorAction SilentlyContinue
Get-TSSession -ComputerName $Computer -UserName $User -ErrorAction SilentlyContinue | Stop-TSSession -ErrorAction SilentlyContinue
}
