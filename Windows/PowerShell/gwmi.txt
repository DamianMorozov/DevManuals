============================================================================================================================================
get-wmiobject
gwmi
gets instances of windows management instrumentation (wmi) classes or information about the available classes.
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-wmiobject
============================================================================================================================================
# process
gwmi win32_process -filter "commandline like '%msiexec%'" | select processid, executablepath, commandline
gwmi win32_process | select processid, executablepath, commandline | where { $_ -match "msiexec" }
--------------------------------------------------------------------------------------------------------------------------------------------
# services
get-service | where-object { $_.status -eq "running" }
gwmi win32_service
gwmi win32_service -filter "name like '%sql%'"
# named service on multiple computers
get-wmiobject -query "select * from win32_service where name='winrm'" -computername server01, server02 | format-list -property pscomputername, name, exitcode, name, processid, startmode, state, status
# stop a service on a remote computer
(get-wmiobject -class win32_service -filter "name='winrm'" -computername server01).stopservice()
# services on a remote computer
gwmi win32_service -credential fabrikam\administrator -computername fabrikam
--------------------------------------------------------------------------------------------------------------------------------------------
# wmi classes in the root or default namespace of the local computer
get-wmiobject -namespace "root/default" -list
--------------------------------------------------------------------------------------------------------------------------------------------
# list
gwmi -list
--------------------------------------------------------------------------------------------------------------------------------------------
# providers
get-psprovider
--------------------------------------------------------------------------------------------------------------------------------------------
# drivers
gwmi -list | where { $_ -match "driver" }
gwmi win32_systemdriver | select name, state, status, started
gwmi win32_pnpsigneddriver | select devicename, manufacturer, driverversion
gwmi win32_driverfordevice | select __genus, __class, __superclass, __dynasty, __relpath
--------------------------------------------------------------------------------------------------------------------------------------------
# bios version
gwmi win32_bios
# bios on the local computer
get-wmiobject -class win32_bios | format-list -property *
gwmi -class win32_bios | format-list -property *
gwmi win32_bios | format-list -property *
--------------------------------------------------------------------------------------------------------------------------------------------
# free space
gwmi win32_logicaldisk | select deviceid, freespace, size
--------------------------------------------------------------------------------------------------------------------------------------------
# software
gwmi -list | where { $_ -match "software" }
gwmi win32_product
gwmi win32_product | where { $_ -match "productname" }
gwmi win32_product -filter "caption like '%productname%'"
gwmi win32_product | select identifyingnumber, name, vendor, version, language
gwmi win32_product | select identifyingnumber, name, vendor, version, language | where { $_ -match "productname" }
gwmi win32_product | select identifyingnumber, name, vendor, version, language | where { $_ -match "productname" }
gwmi win32_product | select identifyingnumber, name, vendor, version, language | where { $_ -match "virtual comport driver" }
gwmi win32_product | select identifyingnumber, name, vendor, version, language | where { $_.name -like "*visual c++ library*" }
--------------------------------------------------------------------------------------------------------------------------------------------
# msi packages
gwmi win32_product | format-table name, localpackage -autosize
gwmi win32_product | format-table identifyingnumber, name, vendor, version, caption -autosize
--------------------------------------------------------------------------------------------------------------------------------------------
