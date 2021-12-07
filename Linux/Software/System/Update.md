# How to install updates via command line?
	$ sudo apt update && sudo apt upgrade

# Fetch the list of available updates
	$ sudo apt update

# Install updates without remove packages
	$ sudo apt upgrade

# Installs updates with remove packages
	$ sudo apt full-upgrade

# Remove any old packages that are no longer needed
	$ sudo apt autoremove

# Execute all the commands by typing sudo once
	$ sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
	$ sudo apt update
	$ sudo apt upgrade -y
	$ sudo apt dist-upgrade -y
	$ sudo apt autoremove -y
	$ sudo apt autoclean -y
	$ sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y

# Ubuntu version
	$ lsb_release -a

# Check the availability of the latest version
	$ sudo do-release-upgrade

# Allow to upgrade Ubuntu version
	$ sudo vim /etc/update-manager/release-upgrades

# Start Upgrading Ubuntu Using Single Command ‘do-release-upgrade’
	$ sudo do-release-upgrade -d -m desktop
	$ sudo do-release-upgrade
