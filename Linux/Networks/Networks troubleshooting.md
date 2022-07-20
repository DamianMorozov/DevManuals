# Networks troubleshooting

## Network Manager settings not sticking after reboot
Look and remove the file: '/etc/netplan/ethernet-eth0.yaml'
Check the result of command: `sudo journalctl -b 0 -u NetworkManager`
