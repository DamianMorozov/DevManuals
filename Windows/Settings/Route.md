# Route

http://info-comp.ru/sisadminst/147-programrouteadd.html

`route print`

## Samples
route –p add 192.168.1.0 mask 255.255.255.0 192.168.1.1
             dest net                       proxy

-f          -- removes all routes from the routing table
-p          –- permanently saves the route
add         –- adds a new route
change      -- changes the current route in the routing table
delete      -- removes route from the routing table
print       -- displays the contents of the routing table
destination -- use this parameter to specify the destination network identifier when adding or changing routes
mask        -- when adding or changing routes, use this parameter to specify the subnet mask for the destination network
gateway     -- used to specify the gateway (router or modem) when adding or changing a route
metric      -- used to specify an integer number between 1 and 9999, which is the cost metric for the route
               If there is more than one possible route for a given destination network, the route with the lowest metric value will be used
if          -- is used to specify the index number of the interface that is connected to the destination network
