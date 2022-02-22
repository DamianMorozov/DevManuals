View all HDD
$ sudo fdisk -l
View HDD model
$ sudo hdparm -i /dev/sdb | grep Model
Bad blocks test
$ sudo badblocks -b 4096 -s -v /dev/sdb > HDD/sdb_badblock.txt
Unmount HDD
$ sudo umount /dev/sdf1
Bad blocks remap for ext2/3/4 file systems
$ sudo e2fsck -l badblock_remap.txt /dev/sdb
Bad blocks remap for ext2/3/4 file systems
$ sudo e2fsck -ct /dev/sdb
Bad blocks remap for other file systems
$ sudo fsck -l badblock_remap.txt /dev/sdb

Smartmontools
$ sudo apt-get install smartmontools
$ man smartctl
$ smartctl -h
$ sudo smartctl -H /dev/sdb

