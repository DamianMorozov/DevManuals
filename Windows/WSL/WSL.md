# Windows Subsystem for Linux

- [Back to the Home page](../../README.md)
- [Back to the Windows page](../README.md)
- [Back to the README page](README.md)

- [Install WSL](https://docs.microsoft.com/en-US/windows/wsl/install-win10)
- [Troubleshooting Windows Subsystem for Linux](https://docs.microsoft.com/en-US/windows/wsl/troubleshooting)
- [How do I know what version of WSL I have?](https://linuxhint.com/check-wsl-version/)
- [Install your Linux distribution of choice](https://aka.ms/wslstore)


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
