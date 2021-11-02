# Windows Subsystem for Linux Installation Guide for Windows 10
[Install WSL](https://docs.microsoft.com/en-US/windows/wsl/install-win10 "docs.microsoft.com")
[Troubleshooting Windows Subsystem for Linux](https://docs.microsoft.com/en-US/windows/wsl/troubleshooting "docs.microsoft.com")
[How do I know what version of WSL I have?](https://linuxhint.com/check-wsl-version/ "linuxhint.com")
[Install your Linux distribution of choice](https://aka.ms/wslstore "aka.ms")

## Install
PowerShell> `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
PowerShell> `dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
PowerShell> `wsl --install`

## Update to WSL 2
PowerShell> `wsl --list --verbose`
PowerShell> `wsl -l -v`
PowerShell> `wsl --set-default-version 2`
PowerShell> `wsl --set-version [distro_name] [wsl_version_number]`

## Linux commands
`$ passwd`
`$ sudo apt update && sudo apt upgrade`
