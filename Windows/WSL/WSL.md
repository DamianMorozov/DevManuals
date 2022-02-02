# Windows Subsystem for Linux

[Install WSL](https://docs.microsoft.com/en-US/windows/wsl/install-win10 "docs.microsoft.com")

[Troubleshooting Windows Subsystem for Linux](https://docs.microsoft.com/en-US/windows/wsl/troubleshooting "docs.microsoft.com")

[How do I know what version of WSL I have?](https://linuxhint.com/check-wsl-version/ "linuxhint.com")

[Install your Linux distribution of choice](https://aka.ms/wslstore "aka.ms")


## Install (PowerShell)
	dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
	dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
	wsl --install

## Update to WSL 2 (PowerShell)
	wsl --list --verbose
	wsl -l -v
	wsl --set-default-version 2
	wsl --set-version [distro_name] [wsl_version_number]

## Restart Ubuntu
	wsl --shutdown
