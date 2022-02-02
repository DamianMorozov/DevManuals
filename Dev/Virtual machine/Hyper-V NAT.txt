----------------------------------------------------------------------------------------------------
Hyper-V NAT.
https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/setup-nat-network
https://interface31.ru/tech_it/2019/06/nastraivaem-set-nat-v-hyper-v.html
Run powershell as admin
----------------------------------------------------------------------------------------------------
View
------
View all virtual device
> Get-VMSwitch
View network devices & get ifIndex
> Get-NetAdapter | Sort-Object Name
Get the PCI slot information for network adapters
> Get-NetAdapterHardwareInfo | Sort-Object Name
View all exists ip adress
> Get-NetIPAddress -AddressFamily IPv4
View exists ip adress on interface
> Get-NetIPAddress -InterfaceIndex @ifIndex
> Get-NetIPAddress -InterfaceAlias "vEthernet (HYPER-NAT)"
View exists NAT
> Get-NetNat
View the virtual network adapters of a virtual machine
> Get-VMNetworkAdapter -VMName @devName
----------------------------------------------------------------------------------------------------
Create
------
Create new virtual device
> New-VMSwitch -SwitchName "HYPER-NAT" -SwitchType Internal
Setup ip address for new network device
> New-NetIPAddress -IPAddress 192.168.2.9 -PrefixLength 24 -InterfaceIndex @ifIndex
> New-NetIPAddress –IPAddress 192.168.2.9 -PrefixLength 24 -InterfaceAlias "vEthernet (HYPER-NAT)"
NAT create
> New-NetNat -Name "vNAT" -InternalIPInterfaceAddressPrefix 192.168.2.0/24
Create a new NAT forwarding
> Add-NetNatStaticMapping -NatName "VMSwitchNat" -Protocol TCP -ExternalIPAddress 0.0.0.0 -InternalIPAddress 192.168.2.9 -InternalPort 80 -ExternalPort 80
----------------------------------------------------------------------------------------------------
Remove
------
Remove NAT
> Remove-NetNat
Remove ip address for virtual network device
> Remove-NetIPAddress -IPAddress 192.168.2.9 -InterfaceIndex @ifIndex
Remove virtual network device
> Remove-VMSwitch -SwitchName "HYPER-NAT"
----------------------------------------------------------------------------------------------------
