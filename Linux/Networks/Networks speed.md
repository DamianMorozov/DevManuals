# Networks speed

## speedtest
```
sudo apt install speedtest-cli
sudo pip install speedtest-cli
speedtest
speedtest -simple
```

## fast-cli
```
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt install -y nodejs
npm install --global fast-cli
fast
fast -u
```

## cmb
```
sudo apt install cbm
cbm
```

## iperf
```
sudo apt install iperf
iperf -s
iperf -c [server_IP]
```

## nload
```
sudo apt install nload
nload enp0s3
```

## tcptrack
```
sudo apt install tcptrack
sudo tcptrack -i enp0s3
sudo tcptrack -i enp0s3 port 443
```

## iftop
```
sudo apt install iftop
sudo iftop -i enp0s3
```

## wget
```
sudo apt install wget
wget -O /dev/null -q --show-progress http://174.138.175.114/PHX-1GB.test

```

## youtube-dl
```
sudo apt install youtube-dl
youtube-dl -f best --no-part --no-cache-dir -o /dev/null --newline https://www.youtube.com/watch?v=8TLsqgLDMN4
```
