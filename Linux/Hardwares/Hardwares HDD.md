# Hardwares HDD

Quick view: `sudo fdisk -l`
View info: `sudo hdparm -i /dev/sda`
View model info: `sudo hdparm -i /dev/sda | grep Model`
Bad blocks test: `sudo badblocks -b 4096 -s -v /dev/sda > HDD/sda_badblock.txt`
Unmount HDD: `sudo umount /dev/sda`
Bad blocks remap for ext2/3/4 file systems: `sudo e2fsck -l badblock_remap.txt /dev/sda`
Bad blocks remap for ext2/3/4 file systems: `sudo e2fsck -ct /dev/sda`
Bad blocks remap for other file systems: `sudo fsck -l badblock_remap.txt /dev/sda`
smartctl: `sudo apt install smartmontools`
duf: `sudo apt install duf`

## Checks
```
iostat
iostat | grep 'sd'
sudo fdisk -l /dev/sda
sudo hdparm -i /dev/sda
awk '/sd/ {print $3"\t"$10 / 2 / 1024}' /proc/diskstats
awk '/nvme/ {print $3"\t"$10 / 2 / 1024}' /proc/diskstats
sudo smartctl -i -A /dev/sda
sudo smartctl -i -A /dev/sda | awk '/^241/ { print "TBW: "($10 * 512) * 1.0e-12, "TB" } '
sudo smartctl -i -A /dev/sda | awk '/sda/ {print $3"\t"$10 / 2 / 1024}' /proc/diskstats
sudo smartctl --test=short /dev/sda
sudo smartctl -H /dev/sda
sudo smartctl --all /dev/sda
sudo badblocks -b 4096 -s -v /dev/nvme0n1 > nvme0n1_badblock.txt
sudo badblocks -b 8192 -s -v /dev/sda > sda_badblock.txt
```

## Partitions
```
sudo parted -l
lsblk
lsblk -f
```

## Free & used spaces
```
df -H
duf
```

## TBW
```
cat /sys/fs/ext4/sda/lifetime_write_kbytes
cat /sys/fs/ext4/nvme0n1/lifetime_write_kbytes
```
