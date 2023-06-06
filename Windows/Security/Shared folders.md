# Windows shared folders

## Commands
```
net share
net share Admin$ /delete
net share C$ /delete
wmic path Win32_Share
wmic path Win32_Share delete
```

## Disable auto share for workstation
```
reg.exe query "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v AutoShareWks /t REG_DWORD /d 0 /f
```

## Disable auto share for server
```
reg.exe query "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v AutoShareServer /t REG_DWORD /d 0 /f
```

## Disable remote access to shares (Enable UAC remote restrictions)
```
reg.exe query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system"
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system" /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 0 /f
```

## Enable remote access to shares (Disable UAC remote restrictions)
```
reg.exe query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system"
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system" /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f
```
