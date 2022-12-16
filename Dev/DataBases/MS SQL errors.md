# MS SQL errors
Login failed. The login is from an untrusted domain and cannot be used with Integrated authentication

## Fix it
Edit the registry using regedit. (Start –> Run > Regedit )
Navigate to: HKLM\System\CurrentControlSet\Control\LSA
Add a DWORD value called “DisableLoopbackCheck”
Set this value to 1
