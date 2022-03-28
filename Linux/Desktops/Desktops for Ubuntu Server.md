# Desktops for Ubuntu Server

- [Back](README.md)

# Links
[How to Install a Desktop (GUI) on an Ubuntu Server](https://phoenixnap.com/kb/how-to-install-a-gui-on-ubuntu)

Install tasksel
```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install tasksel
```

Install desktops
```
sudo apt-get install slim
sudo apt-get install lightdm
sudo apt-get install kde-plasma-desktop
sudo tasksel install ubuntu-mate-core
sudo tasksel install xubuntu-core
sudo apt-get install xfce4 slim
```

Manage desktop's services
```
sudo service display_manager start
sudo service display_manager stop
```

Switch between GUIs by pressing F1
