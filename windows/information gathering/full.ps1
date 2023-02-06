#create file $hostname.txt in current directory
$hostname = hostname
New-Item .\$hostname.txt | Out-Null


#basic system information
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "SYSTEMINFO" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Systeminfo >> .\$hostname.txt;



#environment variables
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "ENVIRONMENT VARIABLES" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-ChildItem Env: | ft Key,Value >> .\$hostname.txt;


#network information
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "NETWORK INFORMATION" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-NetIPConfiguration | ft InterfaceAlias,InterfaceDescription,IPv4Address >> .\$hostname.txt;


#dns servers
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "DNS SERVERS" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-DnsClientServerAddress -AddressFamily IPv4 | ft >> .\$hostname.txt;


#arp cache
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "ARP CACHE" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-NetNeighbor -AddressFamily IPv4 | ft ifIndex,IPAddress,LinkLayerAddress,State >> .\$hostname.txt;


#routing table
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "ROUTING TABLE" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-NetRoute -AddressFamily IPv4 | ft DestinationPrefix,NextHop,RouteMetric,ifIndex >> .\$hostname.txt;


#network connections
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "NETWORK CONNECTIONS" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Netstat >> .\$hostname.txt;


#connected drives
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "CONNECTED DRIVES" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-Volume >> .\$hostname.txt;


#firewall config
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "FIREWALL CONFIG" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-NetFirewallProfile >> .\$hostname.txt;


#current user
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "CURRENT USER" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

whoami >> .\$hostname.txt;


#user privileges
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "USER PRIVILEGES" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

whoami /priv >> .\$hostname.txt;

#local users
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "LOCAL USERS" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-LocalUser | ft Name,Enabled,LastLogon >> .\$hostname.txt;


#logged in users
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "LOGGED IN USERS" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

qwinsta -NoNewWindow -Wait >> .\$hostname.txt;


#credential manager
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "CREDENTIAL MANAGER" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

cmdkey /list >> .\$hostname.txt;


#user autologon registry items
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "USER AUTOLOGON REGISTRY ITEMS" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon" | select "Default*" >> .\$hostname.txt;


#local groups
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "LOCAL GROUPS" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-LocalGroup | ft Name >> .\$hostname.txt;


#local administrators
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "LOCAL ADMINISTRATORS" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-LocalGroupMember Àäìèíèñòðàòîðû | ft Name, PrincipalSource >> .\$hostname.txt;


#user directories
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "USER DIRECTORIES" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-ChildItem C:\Users | ft Name >> .\$hostname.txt;


#searching for SAM backup files
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "SEARCHING FOR SAM BACKUP FILES" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Test-Path %SYSTEMROOT%\repair\SAM >> .\$hostname.txt;
Test-Path %SYSTEMROOT%\system32\config\regback\SAM >> .\$hostname.txt;


#running processes
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "RUNNING PROCESSES" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

gwmi -Query "Select * from Win32_Process" | where {$_.Name -notlike "svchost*"} | Select Name, Handle, @{Label="Owner";Expression={$_.GetOwner().User}} | ft -AutoSize >> .\$hostname.txt;


#installed software directories
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "INSTALLED SOFTWARE DIRECTORIES" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-ChildItem "C:\Program Files", "C:\Program Files (x86)" | ft Parent,Name,LastWriteTime >> .\$hostname.txt;


#software in registry
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "SOFTWARE IN REGISTRY" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-ChildItem -path Registry::HKEY_LOCAL_MACHINE\SOFTWARE | ft Name >> .\$hostname.txt;


#folders with everyone permissions
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "FOLDERS WITH EVERYONE PERMISSIONS" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-ChildItem "C:\Program Files*", "C:\Program Files (x86)*" | % { try { Get-Acl $_ -EA SilentlyContinue | Where {($_.Access|select -ExpandProperty IdentityReference) -match "Everyone"} } catch {}} >> .\$hostname.txt;


#checking registry for alwaysinstallelevated
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "CHECKING REGISTRY FOR ALWAYSINSTALLELEVATED" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Test-Path -Path "Registry::HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Installer" >> .\$hostname.txt;


#unquoted service paths
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "UNQUOTED SERVICE PATHS" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

gwmi -class Win32_Service -Property Name, DisplayName, PathName, StartMode | Where {$_.StartMode -eq "Auto" -and $_.PathName -notlike "C:\Windows" -and $_.PathName -notlike '"'} | select PathName, DisplayName, Name >> .\$hostname.txt;


#scheduled tasks
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "SCHEDULED TASKS" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-ScheduledTask | where {$_.TaskPath -notlike "\Microsoft*"} | ft TaskName,TaskPath,State >> .\$hostname.txt;
Get-ChildItem C:\Windows\Tasks >> .\$hostname.txt;


#startup commands
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "STARTUP COMMANDS" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-CimInstance Win32_StartupCommand | select Name, command, Location, User >> .\$hostname.txt;


#searching for useful files containing sensitive information
echo "`n`n`n" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;
echo "SEARCHING FOR USEFUL FILES CONTAINING SENSITIVE INFORMATION" >> .\$hostname.txt;
echo "#################################################################################################################################" >> .\$hostname.txt;

Get-Childitem –Path C:\ -Include unattend,sysprep -File -Recurse -ErrorAction SilentlyContinue | where {($_.Name -like ".xml" -or $_.Name -like ".txt" -or $_.Name -like "*.ini")} >> .\$hostname.txt;
Get-Childitem –Path C:\ -Include web.config -File -Recurse -ErrorAction SilentlyContinue >> .\$hostname.txt;
Get-Childitem –Path C:\ -Include password,cred,vnc -File -Recurse -ErrorAction SilentlyContinue >> .\$hostname.txt;
Get-ChildItem c:* -include .xml,.ini,.txt,.config -Recurse -ErrorAction SilentlyContinue | Where-Object {$_.PSPath -notlike "C:\temp" -and $_.PSParentPath -notlike "Reference Assemblies" -and $_.PSParentPath -notlike "Windows Kits"}| Select-String -Pattern "password" >> .\$hostname.txt;
Get-Childitem –Path C:\ -Include php.ini,httpd.conf,httpd-xampp.conf,my.ini,my.cnf -File -Recurse -ErrorAction SilentlyContinue >> .\$hostname.txt;