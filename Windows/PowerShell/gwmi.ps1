# get-WMIObject
gwmi

# List
gwmi -list

# Providers
Get-PSProvider

# Drivers
gwmi -list | where { $_ -match "driver" }
gwmi Win32_SystemDriver | select name, state, status, started
gwmi Win32_PnPSignedDriver | select devicename, manufacturer, driverversion
gwmi Win32_DriverForDevice | select __genus, __class, __superclass, __dynasty, __relpath

# BIOS version
gwmi win32_BIOS

# Free space
gwmi Win32_LogicalDisk | select deviceid, freespace, size

# Software
gwmi -list | where { $_ -match "software" }
gwmi -Class Win32_Product | select identifyingnumber, name, vendor, version, language
gwmi -Class Win32_Product | select identifyingnumber, name, vendor, version, language | where { $_ -match "ProductName" }
gwmi -Class Win32_Product | select identifyingnumber, name, vendor, version, language | where { $_ -match "Virtual Comport Driver" }
gwmi -Class Win32_Product | select identifyingnumber, name, vendor, version, language | where {$_.name -like "*Visual C++ Library*" }

# Services
get-service | where-object { $_.Status -eq "Running" }
