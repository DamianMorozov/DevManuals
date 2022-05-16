# Upgrade to 22.04 LTS

- [How To Upgrade Ubuntu To 22.04 LTS Jammy Jellyfish](https://linuxconfig.org/how-to-upgrade-ubuntu-to-22-04-lts-jammy-jellyfish "linuxconfig.org")


# Upgrade via CLI

## Step 1. Update Ubuntu.
```
sudo apt update 
sudo apt upgrade
sudo apt dist-upgrade
```

## Step 2. Remove all no longer required packages.
```
sudo apt autoremove
```

## Step 3. Install the update-manager-core package with apt.
```
sudo apt install update-manager-core
```

## Step 4. Run the Ubuntu upgrade utility
```
sudo do-release-upgrade
```

## Step 5. Type y and press enter.

## Step 6. Once again, you will be required to type y and press enter.

## Step 7. Reboot the system.


# Upgrade via GUI

## Step 1. Launch the GUI upgrader.
```
sudo do-release-upgrade -f DistUpgradeViewGtk3
```

## Step 2. Click 'Upgrade' to proceed with the install.

## Step 3. Ubuntu will now perform the upgrade, and there is not much to do other than wait for this process to finish.

## Step 4. Click 'Start Upgrade'.

## Step 5. Remove the obsolete packages.

## Step 6. Reboot the system.
