@rem | SYSTEM INFO
PowerShell -Command "Start-Process "systeminfo" -NoNewWindow -Wait"


@rem | ENVIRONMENT VARIABLES
PowerShell -Command "Get-ChildItem Env: | ft Key,Value"


@rem | NETWORK INFORMATION
PowerShell -Command "Get-NetIPConfiguration | ft InterfaceAlias,InterfaceDescription,IPv4Address"


@rem | DNS SERVERS
PowerShell -Command "Get-DnsClientServerAddress -AddressFamily IPv4 | ft"


@rem | ARP CACHE
PowerShell -Command "Get-NetNeighbor -AddressFamily IPv4 | ft ifIndex,IPAddress,LinkLayerAddress,State"


@rem | ROUTING TABLE
PowerShell -Command "Get-NetRoute -AddressFamily IPv4 | ft DestinationPrefix,NextHop,RouteMetric,ifIndex"


@rem | NETWORK CONNECTIONS
PowerShell -Command "Start-Process "netstat" -ArgumentList "-ano" -NoNewWindow -Wait"


@rem | CONNECTED DRIVES
PowerShell -Command "Get-PSDrive | where {$_.Provider -like "Microsoft.PowerShell.Core\FileSystem"}"


@rem | FIREWALL CONFIG
PowerShell -Command "Start-Process "netsh" -ArgumentList "firewall show config" -NoNewWindow -Wait"


@rem | CURRENT USER
PowerShell -Command "Write-Host $env:UserDomain\$env:UserName"


@rem | USER PRIVILEGES
PowerShell -Command "Start-Process "whoami" -ArgumentList "/priv" -NoNewWindow -Wait"


@rem | LOCAL USERS
PowerShell -Command "Get-LocalUser | ft Name,Enabled,LastLogon"


@rem | LOGGED IN USERS
PowerShell -Command "Start-Process "qwinsta" -NoNewWindow -Wait"


@rem | CREDENTIAL MANAGER
PowerShell -Command "Start-Process "cmdkey" -ArgumentList "/list" -NoNewWindow -Wait"


@rem | USER AUTOLOGON REGISTRY ITEMS
PowerShell -Command "Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon" | select "Default*""


@rem | LOCAL GROUPS
PowerShell -Command "Get-LocalGroup | ft Name"


@rem | LOCAL ADMINISTRATORS
PowerShell -Command "Get-LocalGroupMember Administrators | ft Name, PrincipalSource"


@rem | USER DIRECTORIES
PowerShell -Command "Get-ChildItem C:\Users | ft Name"


@rem | SEARCHING FOR SAM BACKUP FILES
PowerShell -Command "Test-Path %SYSTEMROOT%\repair\SAM ; Test-Path %SYSTEMROOT%\system32\config\regback\SAM"


@rem | RUNNING PROCESSES
PowerShell -Command "gwmi -Query "Select * from Win32_Process" | where {$_.Name -notlike "svchost*"} | Select Name, Handle, @{Label="Owner";Expression={$_.GetOwner().User}} | ft -AutoSize"


@rem | INSTALLED SOFTWARE DIRECTORIES
PowerShell -Command "Get-ChildItem "C:\Program Files", "C:\Program Files (x86)" | ft Parent,Name,LastWriteTime"


@rem | SOFTWARE IN REGISTRY
PowerShell -Command "Get-ChildItem -path Registry::HKEY_LOCAL_MACHINE\SOFTWARE | ft Name"


@rem | FOLDERS WITH EVERYONE PERMISSIONS
PowerShell -Command "Get-ChildItem "C:\Program Files*", "C:\Program Files (x86)*" | % { try { Get-Acl $_ -EA SilentlyContinue | Where {($_.Access|select -ExpandProperty IdentityReference) -match "Everyone"} } catch {}}"


@rem | CHECKING REGISTRY FOR ALWAYSINSTALLELEVATED
PowerShell -Command "Test-Path -Path "Registry::HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Installer""


@rem | UNQUOTED SERVICE PATHS
PowerShell -Command "gwmi -class Win32_Service -Property Name, DisplayName, PathName, StartMode | Where {$_.StartMode -eq "Auto" -and $_.PathName -notlike "C:\Windows" -and $_.PathName -notlike '"'} | select PathName, DisplayName, Name"


@rem | SCHEDULED TASKS
PowerShell -Command "Get-ChildItem C:\Windows\Tasks"


@rem | STARTUP COMMANDS
PowerShell -Command "Get-CimInstance Win32_StartupCommand | select Name, command, Location, User"


@rem | SEARCHING FOR USEFUL FILES CONTAINING SENSITIVE INFORMATION 
PowerShell -Command "Get-Childitem –Path C:\ -Include unattend,sysprep -File -Recurse -ErrorAction SilentlyContinue | where {($_.Name -like ".xml" -or $_.Name -like ".txt" -or $_.Name -like "*.ini")}"

PowerShell -Command "Get-Childitem –Path C:\ -Include web.config -File -Recurse -ErrorAction SilentlyContinue"

PowerShell -Command "Get-Childitem –Path C:\ -Include password,cred,vnc -File -Recurse -ErrorAction SilentlyContinue"

PowerShell -Command "Get-ChildItem c:* -include .xml,.ini,.txt,.config -Recurse -ErrorAction SilentlyContinue | Where-Object {$_.PSPath -notlike "C:\temp" -and $_.PSParentPath -notlike "Reference Assemblies" -and $_.PSParentPath -notlike "Windows Kits"}| Select-String -Pattern "password""

PowerShell -Command "Get-Childitem –Path C:\ -Include php.ini,httpd.conf,httpd-xampp.conf,my.ini,my.cnf -File -Recurse -ErrorAction SilentlyContinue"

@rem | PowerShell -NoProfile -ExecutionPolicy Bypass -Command "systeminfo"
@rem | PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem Env: | ft Key,Value"
@rem | PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Get-NetIPConfiguration | ft InterfaceAlias,InterfaceDescription,IPv4Address"

@rem | WAIT
PowerShell -Command "pause"
