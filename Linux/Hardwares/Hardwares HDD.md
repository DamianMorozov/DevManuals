# Hardwares HDD

Quick view: `sudo fdisk -l`
View info: `sudo hdparm -i /dev/sda`
View model info: `sudo hdparm -i /dev/sda | grep Model`
Bad blocks test: `sudo badblocks -b 4096 -s -v /dev/sda > HDD/sda_badblock.txt`
Unmount HDD: `sudo umount /dev/sda`
Bad blocks remap for ext2/3/4 file systems: `sudo e2fsck -l badblock_remap.txt /dev/sda`
Bad blocks remap for ext2/3/4 file systems: `sudo e2fsck -ct /dev/sda`
Bad blocks remap for other file systems: `sudo fsck -l badblock_remap.txt /dev/sda`

Smartmontools
```
sudo apt-get install smartmontools
man smartctl
smartctl -h
sudo smartctl -H /dev/sda
```
