@rem | Enable to change variables in cycle
Setlocal EnableDelayedExpansion

@rem | Write System Name to variable
SET pc_name=%COMPUTERNAME%

@rem | If file with the same name already exists, skip writing CSS style and jump to config writing
IF EXIST %~dp0%pc_name%.html GOTO L1
  
@rem | Write CSS style
@ECHO ^<head^>^<style^> >> %~dp0%pc_name%.html
@ECHO .div-main {width: 100^%%; height: 800px; padding: 10px; margin: 10px;} >> %~dp0%pc_name%.html
@ECHO .div-table {display: inline-block; width: auto; height: 780px; border-left: 1px solid black; padding: 10px; float: left; margin-top: 10px; margin-left: 10px; margin-bottom: 10px;} >> %~dp0%pc_name%.html
@ECHO .div-table-sec {display: inline-block; width: auto; height: 780px; border-left: 1px solid black; padding: 10px; margin-top: 10px; margin-bottom: 10px;} >> %~dp0%pc_name%.html
@ECHO .div-table-row {display: table-row;} >> %~dp0%pc_name%.html
@ECHO .div-table-cell-date {width: auto; padding: 10px 40px 10px; border-top: 1px solid black; border-right: 1px solid black; float: right; color: red;} >> %~dp0%pc_name%.html
@ECHO .div-table-cell-pcname {width: auto; padding: 10px 40px 10px; border-top: 1px solid black; border-left: 1px solid black; float: left;} >> %~dp0%pc_name%.html
@ECHO .div-table-cell-long {width: auto; min-width: 180px; max-width: 400px; padding: 10px 20px 10px; border-top: 1px solid black; border-left: 1px solid black; float: left;} >> %~dp0%pc_name%.html
@ECHO .div-table-cell {width: 180px; padding: 10px 20px 10px; border-top: 1px solid black; border-left: 1px solid black; float: left;} >> %~dp0%pc_name%.html
@ECHO ^</head^>^</style^> >> %~dp0%pc_name%.html
  
@rem | Jump here if file with the same name already exists
:L1
  
@rem | Open main div-table
ECHO ^<div class=^"div-main^"^> >> %~dp0%pc_name%.html
  
@rem | Open first div-table for hardware info
ECHO ^<div class=^"div-table^"^> >> %~dp0%pc_name%.html
  
@rem | Write system name and date
ECHO ^<div class=^"div-table-row^"^>System Name^</div^> >> %~dp0%pc_name%.html
ECHO ^<div class=^"div-table-row^"^>^<div class=^"div-table-cell-pcname^"^>%pc_name%^</div^>^<div class=^"div-table-cell-date^"^>%DATE% %TIME:~0,-3%^</div^>^</div^> >> %~dp0%pc_name%.html
  
@rem | Write info on network adapters
ECHO ^<div class=^"div-table-row^"^>Network Adapters^</div^> >> %~dp0%pc_name%.html
  
@rem | Get string with MAC as first token and NetworkAdapter name as all other tokens in string
@rem | Write all tokens except first - it is NetworkAdapter name
@rem | Write first token - it is MAC Address
FOR /F "tokens=1*" %%p IN ('wmic path Win32_NetworkAdapter where PhysicalAdapter^=true get macaddress^,name ^| findstr [0-9]') DO (
ECHO ^<div class=^"div-table-row^"^>^<div class=^"div-table-cell-long^"^>%%q^</div^> >> %~dp0%pc_name%.html
ECHO ^<div class=^"div-table-cell^"^>%%p^</div^>^</div^> >> %~dp0%pc_name%.html
)
  
@rem | Write info on Operating System
ECHO ^<div class=^"div-table-row^"^>Operating System^</div^> >> %~dp0%pc_name%.html
FOR /F "skip=2 tokens=2,3 delims=," %%i IN ('wmic path win32_OperatingSystem get Caption^, Version /format:csv') DO (
ECHO ^<div class=^"div-table-row^"^>^<div class=^"div-table-cell^"^>Name^</div^>^<div class=^"div-table-cell^"^>%%i^</div^>^</div^> >> %~dp0%pc_name%.html
ECHO ^<div class=^"div-table-row^"^>^<div class=^"div-table-cell^"^>Version^</div^>^<div class=^"div-table-cell^"^>%%j^</div^>^</div^> >> %~dp0%pc_name%.html
)

@rem | Write OS Architectire. Use separated command for comaptibility with WinXP (Yeah, XP in 2022) for it has no OSArchitecture method
FOR /F "skip=2 tokens=2* delims=," %%i IN ('wmic path Win32_Processor where DeviceID^=^"CPU0^" get DataWidth /format:csv') DO (
ECHO ^<div class=^"div-table-row^"^>^<div class=^"div-table-cell^"^>Architecture^</div^>^<div class=^"div-table-cell^"^>%%i^</div^>^</div^> >> %~dp0%pc_name%.html
)  

@rem | Write Windows activation status
FOR /F "tokens=* skip=1" %%i IN ('cscript.exe /nologo c:\windows\system32\slmgr.vbs /xpr') DO (
ECHO ^<div class=^"div-table-row^"^>^<div class=^"div-table-cell^"^>Activation^</div^>^<div class=^"div-table-cell^"^>%%i^</div^>^</div^> >> %~dp0%pc_name%.html
)

@rem | Write info on network connectors
@rem | Get mac address, Connection name and Connection status in CSV format
FOR /F "skip=2 tokens=2-4 delims=," %%i IN ('wmic path Win32_NetworkAdapter where "PhysicalAdapter='true'" get MACAddress^, NetConnectionID^, NetConnectionStatus /format:csv') DO (

@rem | For all variables in CMD after FOR loop has string type 
@rem | Change connection status type to digit by adding zero and assign to con_stat variable
@rem | Otherwise IF statement WILL NOT work properly because it will have to compare digit with string
SET /A con_stat=%%k+0

@rem | IF connection status is 2 (active, connected) 
@rem | Write connection name
IF !con_stat! EQU 2 (
ECHO ^<div class=^"div-table-row^"^>%%j^(Active^)^</div^> >> %~dp0%pc_name%.html

@rem | Write MAC address of active connection
ECHO ^<div class=^"div-table-row^"^>^<div class=^"div-table-cell^"^>MAC Address^</div^>^<div class=^"div-table-cell^"^>%%i^</div^>^</div^> >> %~dp0%pc_name%.html
  
@rem | Write IP address, Network mask and Gateway of active connection
@rem | Get network info on active connection in "VALUE" format
FOR /F "tokens=1,2 delims=^={}" %%a IN ('wmic path Win32_NetworkAdapterConfiguration where "ipenabled='true' AND MACADDRESS='%%i'" get DefaultIPGateway^, IPAddress^, IPSUbnet /format:value ^| findstr [0-9]') DO (

rem | Use inner FOR cycle to get rid of IPv6 address and netmask additional info, if any
rem | feed to FOR cycle variable where stored both IPv4 and IPv6 addresses separated by comma
rem | And take only first token which is IPv4 address
FOR /F "tokens=1 delims=," %%q IN (%%b) DO (

@rem | Get rid of double quotes in output
SET q_temp=%%q
SET q_final=!q_temp:"=!
)

@rem | Write results
ECHO ^<div class=^"div-table-row^"^>^<div class=^"div-table-cell^"^>%%a^</div^>^<div class=^"div-table-cell^"^>!q_final!^</div^>^</div^> >> %~dp0%pc_name%.html
)

@rem | ELSE if connection status is NOT 2
) ELSE (
@rem | Write inactive connection name 
ECHO ^<div class=^"div-table-row^"^>%%j^(Inactive^)^</div^> >> %~dp0%pc_name%.html

@rem | Write inactive connection MAC Address 
ECHO ^<div class=^"div-table-row^"^>^<div class=^"div-table-cell^"^>MAC Address^</div^>^<div class=^"div-table-cell^"^>%%i^</div^>^</div^> >> %~dp0%pc_name%.html
) 
)

@rem | Close main positioning div
ECHO ^</div^> >> %~dp0%pc_name%.html

@rem | Wait for user interaction
pause
