====================================================================================================
https://docs.microsoft.com/en-us/powershell/module/hyper-v/
https://github.com/MicrosoftDocs/windows-powershell-docs/blob/master/docset/windows/hyper-v/
====================================================================================================
ACL
---------------------------------------------------------------------------------------------------- 
Remove
> Get-VMNetworkAdapterAcl -VMName @devName | Remove-VMNetworkAdapterAcl
View
> Get-VMNetworkAdapterAcl
> Get-VMNetworkAdapterAcl -VMName @devName | ft direction,action,*address,*port,protocol,stateful,*timeout,*weight -auto
Deny
> Add-VMNetworkAdapterAcl -VMName @devName -RemoteIPAddress ANY -Direction Both -Action Deny
Allow
> Add-VMNetworkAdapterAcl -VMName @devName -RemoteIPAddress 192.168.1.0/24 -Direction Both -Action Allow
Allow traffic meter
> Add-VMNetworkAdapterAcl -VMName @devName -RemoteIPAddress 192.168.1.1 -Direction Outbound -Action Meter
====================================================================================================
Extended ACL
---------------------------------------------------------------------------------------------------- 
Remove
> Get-VMNetworkAdapterExtendedAcl -VMName @devName | Remove-VMNetworkAdapterExtendedAcl
> Remove-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Inbound -Weight 0
> Remove-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Inbound -Weight 1
> Remove-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Inbound -Weight 2
> Remove-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Inbound -Weight 10
View
> Get-VMNetworkAdapterExtendedAcl
> Get-VMNetworkAdapterExtendedAcl -VMName @devName | ft direction,action,*address,*port,protocol,stateful,*timeout,*weight -auto
Deny
> Add-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Inbound -Action Deny -Weight 1
> Add-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Outbound -Action Deny -Weight 1
Allow
> Add-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Inbound -LocalPort "3389" -Protocol "TCP" -Action Allow -Weight 2
> Add-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Inbound -Protocol 2 -Action Allow -Weight 10
> Add-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Outbound -Protocol 2 -Action Allow -Weight 10
> Add-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Outbound -Protocol "TCP" -RemotePort "80" -Action Allow -Weight 3 -Stateful $true -IdleSessionTimeout 3600
> Add-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Outbound -Protocol "TCP" -RemotePort "443" -Action Allow -Weight 4 -Stateful $true -IdleSessionTimeout 3600
> Add-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Inbound -Protocol "TCP" -LocalPort 5000-5010 -Action Allow -Weight 20 -Stateful $true -IdleSessionTimeout 600
> Add-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Inbound -Protocol "TCP" -LocalPort 80 -Action Allow -Weight 21 -Stateful $true -IdleSessionTimeout 600
> Add-VMNetworkAdapterExtendedAcl -VMName @devName -Direction Inbound -Protocol "TCP" -LocalPort 443 -Action Allow -Weight 22 -Stateful $true -IdleSessionTimeout 600
====================================================================================================
