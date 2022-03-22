# Diskpart

diskpart
list disk
select disk x
list partition
select partition x
format fs=ntfs label="Flash 16 Gb" quick compress

350MB – Windows RE
99MB – EFI
MSR (не отображается)
C – Windows, раздел с ОС

diskmgmt.msc

Создание конфигурации разделов для разметки GPT

1. С помощью графического интерфейса программы установки Windows
Этот способ работает только при наличии установочного диска, конечно. Достаточно начать установку, дойти до экрана конфигурации дисков и создать раздел на незанятом пространстве.
Программа установки автоматически создаст все необходимые разделы.

2. diskpart
list disk
rem === First logical drive =======================
select disk 0
clean
convert gpt
rem == 1. Windows RE tools partition ===============
create partition primary size=350
format quick fs=ntfs label="Windows RE"
assign letter=T
set id="de94bba4-06d1-4d40-a16a-bfd50179d6ac"
gpt attributes=0x8000000000000001  -- 0x8 000 000 000 000 001
rem == 2. System partition =========================
create partition efi size=260
format quick fs=fat32 label="System"  -- видит только флешки FAT32
assign letter=S
rem == 3. Microsoft Reserved (MSR) partition =======
create partition msr size=128
rem == 4. Windows partition ========================
create partition primary
--shrink minimum=15000
format quick fs=ntfs label="Windows"
assign letter=W
rem === 5. Data partition ==========================
create partition primary
format quick fs=ntfs label="Data"
list volume
list partition
exit

rem === Second logical drive =======================
select disk 0
clean
convert gpt
rem === 1. Recovery partition ======================
create partition primary size=200000  -- 200000 для DMZ / 60000 для ARM
format quick fs=ntfs label="Recovery"
assign letter=R
attributes vol set nodefaultdriveletter
rem === 2. Backup partition ========================
create partition primary
format quick fs=ntfs label="Backup"
assign letter=B

Windows RE
http://www.outsidethebox.ms/16231/
reagentc /info  -- общая информация о среде восстановления
W:\Windows\System32\reagentc.exe /setreimage /path T:\Recovery\WindowsRE /target W:\Windows

Windows RE - 
EFI - системный раздел
MSR (Microsoft Reserved partition) - раздел, зарезервированный Microsoft

http://www.outsidethebox.ms/16075/
https://msdn.microsoft.com/ru-ru/library/hh825686.aspx
https://technet.microsoft.com/ru-ru/library/cc766465(v=ws.10).aspx

setid id=07 override  -- стандартный раздел NTFS
setid id=17 override  -- скрытый раздел
setid id=27 override  -- делает раздел технологическим и скрытым
