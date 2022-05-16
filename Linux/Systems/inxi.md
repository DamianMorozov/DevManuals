# inxi

- [inxi - see various system information](https://linuxconfig.org/installation-of-inxi-system-information-script-on-debian-wheezy)

## Install
```
sudo apt update
sudo apt install inxi
```

## Use
```
inxi
inxi --help            ## help information
inxi --full            ## full information
inxi --full -c 2       ## full information with different colors
inxi -C                ## CPU information
inxi -G                ## graphics information
inxi -w                ## weather local information
inxi -W Warsaw,Poland  ## weather location information
inxi --recommends      ## checks inxi application dependencies + recommends, and directories
```
