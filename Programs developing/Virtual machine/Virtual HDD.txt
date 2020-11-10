----------------------------------------------------------------------------------------------------
Convert OVA/VDMK to VHD
1. Unpack VDMK from OVA file.
2. Install VirtualBox.
3. "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" clonehd --format vhd "C:\VM\disk1.vmdk" "C:\VM\disk1.vhd"
----------------------------------------------------------------------------------------------------
Convert VHD to VHDX.
1. Install and run Hyper-V.
2. Change disk -> choose VHD -> Next -> Convert -> VHDX
----------------------------------------------------------------------------------------------------
