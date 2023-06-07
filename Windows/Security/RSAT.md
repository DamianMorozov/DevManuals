# RSAT Administration Tools

## Links
- [RSAT for Windows 10 1803/1709](https://www.microsoft.com/en-us/download/details.aspx?id=45520)
- [RSAT for Windows 8.1](https://www.microsoft.com/en-us/download/details.aspx?id=39296)
- [Installing RSAT Administration Tools on Windows 10 and 11](https://woshub.com/install-rsat-feature-windows-10-powershell/)
- [Install Active Directory Users and Computers (ADUC) Snap-in on Windows 10/11](https://woshub.com/install-active-directory-users-computers-aduc-console/)
- [Configure Windows LAPS (Local Administrator Passwords Solution) in AD](https://woshub.com/manage-local-administrator-passwords-with-laps/)

## View installed RSAT in Power Shell
```Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State```

## Install RSAT in Power Shell
```
Add-WindowsCapability -online -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0
Add-WindowsCapability –online –Name Rsat.Dns.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.FileServices.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.IPAM.Client.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.LLDP.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.NetworkController.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.CertificateServices.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.DHCP.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.RemoteDesktop.Services.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.ServerManager.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.Shielded.VM.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.StorageReplica.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.SystemInsights.Management.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.VolumeActivation.Tools~~~~0.0.1.0
Add-WindowsCapability -Online -Name Rsat.WSUS.Tools~~~~0.0.1.0
```

## To install all the available RSAT tools at once
```Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability –Online```

## To install only the missing RSAT tools
```Get-WindowsCapability -Name RSAT* -Online | where State -EQ NotPresent | Add-WindowsCapability –Online```

## Install RSAT in DISM
```DISM.exe /Online /add-capability /CapabilityName:Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0 /CapabilityName:Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0 /CapabilityName:Rsat.WSUS.Tools~~~~0.0.1.0```
