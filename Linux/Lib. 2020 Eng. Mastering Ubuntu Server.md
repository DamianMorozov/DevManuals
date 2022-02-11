# Library. 2020 Eng. Mastering Ubuntu Server

## Managing Users and Permissions

- `sudo useradd -d /home/user1 -m user1` -- create the user
- `ls -l /home` -- list the storage of /home using
- `passwd` -- change the password
- `sudo passwd user1` -- change the password for user
- `sudo adduser user2` -- create the user
- `nano /usr/sbin/adduser` -- open script adduser in text editor
- `sudo userdel user2` -- remove the user without removing user data
- `sudo mkdir -p /store/file_archive` -- create backup storage folder
- `sudo mv /home/user2 /store/file_archive` -- move user folder to backup storage folder
- `sudo userdel -r user2` -- remove the user with removing user data
- `sudo rm -r /home/user2` -- remove the user folder
- `cat /etc/passwd` -- view user accounts
- `sudo cat /etc/shadow | grep root` -- see passwords hashes
- `sudo passwd -l root` -- lock the password of the named account
- `sudo passwd -u root` -- unlock the password of the named account
- `sudo passwd -S root` -- report password status on the named account
