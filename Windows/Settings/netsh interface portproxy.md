# netsh interface portproxy
https://docs.microsoft.com/en-us/windows-server/networking/technologies/netsh/netsh-interface-portproxy
http://windows.mixed-spb.ru/network/netsh_port_mapping.php

netsh interface portproxy reset      -- reset
netsh interface portproxy show all   -- show rules
netstat -ano | findstr :port         -- view
netsh interface portproxy delete v4tov4 listenport=port listenaddress=remote_host
netsh interface portproxy add v4tov4 listenport=port listenaddress=remote_host connectport=port connectaddress=remote_host
