# W32tm / Windows time update

net stop w32time
w32tm /config /syncfromflags:manual /manualpeerlist:"0.it.pool.ntp.org 1.it.pool.ntp.org 2.it.pool.ntp.org 3.it.pool.ntp.org"
net start w32time
w32tm /config /update
w32tm /resync /rediscover
