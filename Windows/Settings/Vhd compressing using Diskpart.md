# Vhd compressing using Diskpart

Compressing a dynamic vhd disk using Diskpart
http://winitpro.ru/index.php/2011/10/25/kak-szhat-dinamicheskij-vhd/

diskpart
select vdisk file="c:\Data\DAT22GB.vhd"
attach vdisk readonly
compact vdisk  -- Before this procedure, you must enable file and folder compression on each vdisk partition
detach vdisk
