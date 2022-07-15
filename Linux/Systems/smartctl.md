# smartctl

## Install
```
sudo apt update
sudo apt install smartmontools
```

## Usage
```
sudo smartctl -i /dev/sda       -- check HDD is a smart type or not
sudo smartctl -s on /dev/sda    -- enable the smartctl (always starts whenever the system reboots)
smartctl -H /dev/vda            -- check the hard drive health
smartctl -test=short /dev/vda   -- short test on the HDD
smartctl -test=long /dev/vda    -- long test on the HDD
smartctl -s off /dev/vda        -- disable the smartctl on the HDD
```

## Uninstall
```
sudo apt remove smartmontools
```
