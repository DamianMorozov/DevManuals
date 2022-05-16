# Ubuntu update

## Links
- [How To Upgrade Ubuntu To 18.04 LTS Bionic Beaver?](https://linuxconfig.org/how-to-upgrade-to-ubuntu-18-04-lts-bionic-beaver "linuxconfig.org")
- [How To Upgrade Ubuntu To 19.10 Eoan Ermine?](https://linuxconfig.org/how-to-upgrade-ubuntu-to-19-10-eoan-ermine "linuxconfig.org")
- [How To Upgrade Ubuntu To 20.04 LTS Focal Fossa](https://linuxconfig.org/how-to-upgrade-ubuntu-to-20-04-lts-focal-fossa "linuxconfig.org")
- [JammyUpgrades](https://help.ubuntu.com/community/JammyUpgrades "help.ubuntu.com")

## How to install updates via command line?
`sudo apt update -y && sudo apt upgrade -y`

## Fully update and upgrade your current Linux system
`sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade`

## Fetch the list of available updates
`sudo apt update -y`

## Install updates without remove packages
`sudo apt upgrade -y`

## Installs updates with remove packages
`sudo apt full-upgrade`

## Remove any old packages that are no longer needed
`sudo apt autoremove -y`

## Execute all the commands by typing sudo once
```
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
```

## Check the availability of the latest version
`sudo do-release-upgrade`

## Allow to upgrade Linux version
`sudo nano /etc/update-manager/release-upgrades`

## Start Upgrading Linux Using Single Command ‘do-release-upgrade’
```
sudo do-release-upgrade
sudo do-release-upgrade -d -m desktop
```

## Optional, run force the Linux upgrade utility at your own risk
`sudo do-release-upgrade -d`

## Optional, install the one package
`sudo apt install update-manager-core`

## How to Upgrade Linux
```
sudo apt install update-manager-core
sudo do-release-upgrade
sudo do-release-upgrade -d
```

## Reboot your Linux system
`reboot`

## Fix error 'Upgrades to the development release are only available from the latest supported release.'
```
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade
sudo do-release-upgrade
```
