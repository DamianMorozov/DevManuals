# Screen resolution
xdpyinfo | grep dimensions
xdpyinfo | awk '/dimensions/{print $2}'
xdpyinfo | grep -oP 'dimensions:\s+\K\S+'
xrandr | grep ' connected'
xdpyinfo | grep resolution
xrandr

