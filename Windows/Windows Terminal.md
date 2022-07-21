# Windows Terminal

- [Windows Terminal from sourceforge.net](https://sourceforge.net/projects/windows-terminal.mirror/ "sourceforge.net")
- [Windows Terminal from Microsoft Store](https://www.microsoft.com/en-US/p/windows-terminal/9n0dx20hk701 "microsoft.com")

# Manual install Windows Terminal

1. Check the last version here: https://github.com/microsoft/terminal/releases/
Copy the link and use in Invoke-WebRequest, for example:
```bash
Invoke-WebRequest -Uri https://github.com/microsoft/terminal/releases/download/v1.12.2931.0/Microsoft.WindowsTerminalPreview_1.12.2931.0_8wekyb3d8bbwe.msixbundle -outfile Microsoft.WindowsTerminalPreview_1.12.2931.0_8wekyb3d8bbwe.msixbundle
```
2. Install package
```bash
Add-AppxPackage -Path .\Microsoft.WindowsTerminalPreview_1.12.2931.0_8wekyb3d8bbwe.msixbundle
```
