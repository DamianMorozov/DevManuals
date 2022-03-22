# CEIP disable

How to Disable Windows 10 Customer Experience Improvement Program

gpedit.msc
Computer configuration > Administrative Templates > System > Internet Communication Management
Turn off Windows Customer Experience Improvement Program > Disable radio button - Apply - OK.

regedit.exe
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows​
CEIPEnable | REG_DWORD = 0
