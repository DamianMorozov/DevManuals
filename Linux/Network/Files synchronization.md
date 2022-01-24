# Files synchronization


## Syncthing
[Syncthing](https://syncthing.net/ "syncthing.net")
The stable channel is updated with stable release builds, usually every first Tuesday of the month.
Add the release PGP keys
```curl -s https://syncthing.net/release-key.txt | sudo apt-key add -```
Add the "stable" channel to your APT sources
```echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list```
Update and install syncthing
```sudo apt-get update
sudo apt-get install syncthing```

The candidate channel is updated with release candidate builds, usually every second Tuesday of the month.
These predate the corresponding stable builds by about three weeks.
Add the release PGP keys
```curl -s https://syncthing.net/release-key.txt | sudo apt-key add -```
Add the "candidate" channel to your APT sources
```echo "deb https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list```
Update and install syncthing
```sudo apt-get update
sudo apt-get install syncthing```

## Yandex disk
[Консольный клиент Яндекс.Диска для Linux](https://yandex.ru/support/disk/cli-clients.html "yandex.ru")
```sudo dpkg -i yandex-disk_latest_amd64.deb```
Import a GPG key for a .deb package
```wget -O YANDEX-DISK-KEY.GPG http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG
sudo apt-key add YANDEX-DISK-KEY.GPG```
Initial Setup Wizard
```yandex-disk setup```
Get authorization key (OAuth token)
```yandex-disk token [-p, --password=PASSWORD] [OPTION] USERNAME [FILE]```
Start the daemon and synchronize all folders except the exclude-dirs specified in the exclusion list
```yandex-disk start [OPTION]```
Display the status of the daemon
```yandex-disk status [OPTION]```
Stop the demon
```yandex-disk stop [OPTION]```
Synchronize all folders except those specified in the exclude-dirs exclusion list
```yandex-disk sync [OPTION]```
Get a public link to the specified file or folder (FILE)
```yandex-disk publish [OPTION] FILE```
Unpublish for the specified file or folder (FILE)
```yandex-disk unpublish FILE```
Command Usage Examples
```yandex-disk start -c ~/ydconfig/newconfig.cfg # запустить демон и синхронизацию с указанным файлом конфигурации
yandex-disk start --exclude-dirs=Foto # не синхронизировать папку Foto
yandex-disk sync --read-only # синхронизировать папки в режиме read-only
yandex-disk publish Foto # получить публичную ссылку на папку Foto```
