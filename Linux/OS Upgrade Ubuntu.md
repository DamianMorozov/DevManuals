[How To Upgrade Ubuntu To 18.04 LTS Bionic Beaver?](https://linuxconfig.org/how-to-upgrade-to-ubuntu-18-04-lts-bionic-beaver "linuxconfig.org")

[How To Upgrade Ubuntu To 19.10 Eoan Ermine?](https://linuxconfig.org/how-to-upgrade-ubuntu-to-19-10-eoan-ermine "linuxconfig.org")

[How To Upgrade Ubuntu To 20.04 LTS Focal Fossa](https://linuxconfig.org/how-to-upgrade-ubuntu-to-20-04-lts-focal-fossa "linuxconfig.org")

--------

# Fully update and upgrade your current Ubuntu 19.04 Linux system
	sudo apt update && sudo apt upgrade && sudo apt dist-upgrade
# Remove all no longer required packages
	sudo apt autoremove
# Configure the release upgrader (ensure that the Prompt variable is set to normal)
	sudo nano /etc/update-manager/release-upgrades
# Optional, install the one package
	sudo apt install update-manager-core
# Run the Ubuntu upgrade utility
	sudo do-release-upgrade
# Optional, run force the Ubuntu upgrade utility at your own risk
	sudo do-release-upgrade -d
# Reboot your Ubuntu system
	reboot

# How to Upgrade Ubuntu The Ubuntu Way
	sudo apt install update-manager-core
	sudo do-release-upgrade
	sudo do-release-upgrade -d

# Ubuntu Update and Ubuntu Upgrade
	sudo apt update && sudo apt -y dist-upgrade
