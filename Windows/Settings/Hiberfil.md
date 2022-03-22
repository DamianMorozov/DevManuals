# Hiberfil

```
powercfg -h on
powercfg.exe /hibernate on
```

```
powercfg -h off
powercfg.exe /hibernate off
```

How move hiberfil to another folder.
```
powercfg -h off
Edit key in regedit: Computer\HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\BackupRestore\FilesNotToBackup\Power Management
powercfg -h on
```
