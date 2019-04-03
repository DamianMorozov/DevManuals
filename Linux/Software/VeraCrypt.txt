----------------------------------------------------------------------------------------------------
Veracrypt
$ sudo apt install libcanberra-gtk-module libcanberra-gtk3-module
----------------------------------------------------------------------------------------------------
$MFTMirr does not match $MFT (record 0).
Failed to mount '/dev/mapper/veracrypt1': Input/output error
NTFS is either inconsistent, or there is a hardware fault, or it's a
SoftRAID/FakeRAID hardware. In the first case run chkdsk /f on Windows
then reboot into Windows twice. The usage of the /f parameter is very
important! If the device is a SoftRAID/FakeRAID then first activate
it and mount a different device under the /dev/mapper/ directory, (e.g.
/dev/mapper/nvidia_eahaabcc1). Please see the 'dmraid' documentation
for more details.
----------------------------------------------------------------------------------------------------
https://superuser.com/questions/753122/truecrypt-container-with-ntfs-on-a-truecrypt-disk-unmountable
1. Mount with no mount.
2. $ sudo ntfsfix /dev/mapper/veracrypt1
3. Unmount & mount
----------------------------------------------------------------------------------------------------
$ sudo lsof +c0 /media/veracrypt1/
$ sudo kill 8355
$ fuser -mv /media/veracrypt1/ -u
https://askubuntu.com/questions/51154/once-mounted-using-truecrypt-cannot-unmount
$ sudo umount /media/truecrypt1
----------------------------------------------------------------------------------------------------
Run
$ gksudo veracrypt
----------------------------------------------------------------------------------------------------

