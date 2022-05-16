# inxi --help

```
inxi supports the following options. For more detailed information, see man inxi. If you start
inxi with no arguments, it will display a short system summary.

You can use these options alone or together, to show or add the item(s) you want to see: A, B, C,
D, E, G, I, J, L, M, N, P, R, S, W, d, f, i, j, l, m, n, o, p, r, s, t, u, w, --slots. If you use
them with -v [level], -b or -F, inxi will add the requested lines to the output.

Examples: inxi -v4 -c6 OR inxi -bDc 6 OR inxi -FzjJxy 80
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
See Filter Options for output filtering, Output Control Options for colors, sizing, output
changes, Extra Data Options to extend Main output, Additional Options and Advanced Options for
less common situations.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Main Feature Options:
 -A, --audio      Audio/sound devices(s), driver, running sound servers.
 -b, --basic      Basic output, short form. Same as inxi -v 2.
 -B, --battery    System battery info, including charge, condition voltage (if critical), plus
                  extra info (if battery present/detected).
 -C, --cpu        CPU output (if each item available): basic topology, model, type (see man for
                  types), cache, average CPU speed, min/max speeds, per core clock speeds.
 -d, --disk-full, --optical
                  Optical drive data (and floppy disks, if present). Triggers -D.
 -D, --disk       Hard Disk info, including total storage and details for each disk. Disk total
                  used percentage includes swap partition size(s).
 -E, --bluetooth  Show bluetooth device data and report, if available. Shows state, address, IDs,
                  version info.
 -f, --flags      All CPU flags. Triggers -C. Not shown with -F to avoid spamming.
 -F, --full       Full output. Includes all Upper Case line letters (except -J, -W) plus --swap,
                  -s and -n. Does not show extra verbose options such as -d -f -i -J -l -m -o -p
                  -r -t -u -x, unless specified.
 -G, --graphics   Graphics info (devices(s), drivers, display protocol (if available), display
                  server/Wayland compositor, resolution, X.org: renderer, OpenGL version; Xvesa:
                  VBE info.
 -i, --ip         WAN IP address and local interfaces (requires ifconfig or ip network tool).
                  Triggers -n. Not shown with -F for user security reasons. You shouldn't paste
                  your local/WAN IP.
 -I, --info       General info, including processes, uptime, memory, IRC client or shell type,
                  inxi version.
 -j, --swap       Swap in use. Includes partitions, zram, file.
 -J, --usb        Show USB data: Hubs and Devices.
 -l, --label      Partition labels. Use with -j, -o, -p, -P.
 -L, --logical    Logical devices, LVM (VG, LV), LUKS, Crypto, bcache, etc. Shows
                  components/devices, sizes, etc.
 -m, --memory     Memory (RAM) data. Requires root. Numbers of devices (slots) supported and
                  individual memory devices (sticks of memory etc). For devices, shows device
                  locator, size, speed, type (e.g. DDR3). If neither -I nor -tm are selected, also
                  shows RAM used/total.
     --memory-modules
                  Memory (RAM) data. Exclude empty module slots.
     --memory-short
                  Memory (RAM) data. Show only short Memory RAM report, number of arrays, slots,
                  modules, and RAM type.
 -M, --machine    Machine data. Device type (desktop, server, laptop, VM etc.), motherboard, BIOS
                  and, if present, system builder (e.g. Lenovo). Shows UEFI/BIOS/UEFI [Legacy].
                  Older systems/kernels without the required /sys data can use dmidecode instead,
                  run as root. Dmidecode can be forced with --dmidecode
 -n, --network-advanced
                  Advanced Network device info. Triggers -N. Shows interface, speed, MAC id,
                  state, etc.
 -N, --network    Network device(s), driver.
 -o, --unmounted  Unmounted partition info (includes UUID and Label if available). Shows file
                  system type if you have lsblk installed (Linux) or, for BSD/GNU Linux, if 'file'
                  installed and you are root or if you have added to /etc/sudoers (sudo v. 1.7 or
                  newer)(or try doas).
                  Example:  <username> ALL = NOPASSWD: /usr/bin/file
 -p, --partitions-full
                  Full partition information (-P plus all other detected partitions).
 -P, --partitions Basic partition info. Shows, if detected: / /boot /home /opt /tmp /usr /usr/home
                  /var /var/log /var/tmp. Swap partitions show if --swap is not used. Use -p to
                  see all mounted partitions.
 -r, --repos      Distro repository data. Supported repo types: APK, APT, CARDS, EOPKG, NIX,
                  PACMAN, PACMAN-G2, PISI, PKG (BSDs), PORTAGE, PORTS (BSDs), SCRATCHPKG,
                  SLACKPKG, TCE, URPMQ, XBPS, YUM/ZYPP.
 -R, --raid       RAID data. Shows RAID devices, states, levels, array sizes, and components.
                  md-raid: If device is resyncing, also shows resync progress line.
 -s, --sensors    Sensors output (if sensors installed/configured): mobo/CPU/GPU temp; detected
                  fan speeds. GPU temp only for Fglrx/Nvidia drivers. Nvidia shows screen number
                  for > 1 screen. IPMI sensors if present.
     --slots      PCI slots: type, speed, status. Requires root.
 -S, --system     System info: host name, kernel, desktop environment (if in X/Wayland), distro.
 -t, --processes  Processes. Requires extra options: c (CPU), m (memory), cm (CPU+memory). If
                  followed by numbers 1-x, shows that number of processes for each type (default:
                  5; if in IRC, max: 5).
                  Make sure that there is no space between letters and numbers (e.g. -t cm10).
 -u, --uuid       Partition UUIDs. Use with -j, -o, -p, -P.
 -v, --verbosity  Set inxi verbosity level (0-8). Should not be used with -b or -F. Example:
                  inxi -v 4
                      0  Same as: inxi
                      1  Basic verbose, -S + basic CPU + -G + basic Disk + -I.
                      2  Networking device (-N), Machine (-M), Battery (-B; if present), and, if
                         present, basic RAID (devices only; notes if inactive). Same as inxi -b
                      3  Advanced CPU (-C), battery (-B), network (-n); triggers -x.
                      4  Partition size/used data (-P) for (if present) /, /home, /var/, /boot.
                         Shows full disk data (-D).
                      5  Audio device (-A), sensors (-s), memory/RAM (-m), bluetooth (if present),
                         partition label (-l), full swap (-j), UUID (-u), short form of optical
                         drives, RAID data (if present).
                      6  Full partition (-p), unmounted partition (-o), optical drive (-d), USB
                         (-J), full RAID; triggers -xx.
                      7  Network IP data (-i), bluetooth, logical (-L), RAID forced, full CPU
                         flags; triggers -xxx.
                      8  Everything available, including repos (-r), processes (-tcm), PCI slots
                         (--slots); triggers admin (-a).
 -w, --weather    Local weather data/time. To check an alternate location, see -W. NO AUTOMATED
                  QUERIES OR EXCESSIVE USE ALLOWED!
 -W, --weather-location
                  [location] Supported options for [location]: postal code[,country/country code];
                  city, state (USA)/country (country/two character country code); latitude,
                  longitude. Only use if you want the weather somewhere other than the machine
                  running inxi. Use only ASCII characters, replace spaces in city/state/country
                  names with '+'. Example: inxi -W [new+york,ny london,gb madrid,es]
     --weather-source
                  [1-9] Change weather data source. 1-4 generally active, 5-9 check. See man.
     --weather-unit
                  Set weather units to metric (m), imperial (i), metric/imperial (mi), or
                  imperial/metric (im).
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Filter Options:
     --host       Turn on hostname for -S. Overrides -z.
     --no-host    Turn off hostname for -S. Useful if showing output from servers etc. Activated
                  by -z as well.
 -z, --filter     Adds security filters for IP/MAC addresses, serial numbers, location (-w), user
                  home directory name, host name. Default on for IRC clients.
     --zl,--filter-label
                  Filters out partition labels in -j, -o, -p, -P, -Sa.
     --zu,--filter-uuid
                  Filters out partition UUIDs in -j, -o, -p, -P, -Sa.
     --zv,--filter-vulnerabilities
                  Filters out Vulnerabilities report in -Ca.
 -Z, --no-filter  Disable output filters. Useful for debugging networking issues in IRC, or you
                  needed to use --tty, for example.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Output Control Options:
 -c, --color      Set color scheme (0-42). For piped or redirected output, you must use an
                  explicit color selector. Example: inxi -c 11
                  Color selectors let you set the config file value for the selection (NOTE: IRC
                  and global only show safe color set)
                     94  Console, out of X
                     95  Terminal, running in X - like xTerm
                     96  Gui IRC, running in X - like Xchat, Quassel, Konversation etc.
                     97  Console IRC running in X - like irssi in xTerm
                     98  Console IRC not in X
                     99  Global - Overrides/removes all settings. Setting specific removes global.
     --indent     [11-20] Change default wide mode primary indentation width.
     --indents    [0-10] Change wrapped mode primary indentation width, and secondary / -y1 indent
                  widths.
     --limit      [-1; 1-x] Set max output limit of IP addresses for -i (default 10; -1 removes
                  limit).
     --max-wrap,--wrap-max
                  [70-xxx] Set maximum width where inxi autowraps line starters. Current: 110
     --output     [json|screen|xml] Change data output type. Requires --output-file if not screen.
     --output-file
                  [Full filepath|print] Output file to be used for --output.
     --partition-sort
                  [dev-base|fs|id|label|percent-used|size|uuid|used] Change sort order of
                  partition output. See man page for specifics.
 -y, --width      [empty|-1|1|80-xxx] Output line width max. Overrides IRC/Terminal settings or
                  actual widths. If no integer give, defaults to 80. -1 removes line lengths. 1
                  switches output to 1 key/value pair per line. Example: inxi -y 130
 -Y, --height     [empty|-3-xxx] Output height control. Similar to 'less' command except colors
                  preserved, defaults to console/terminal height. -1 shows 1 primary Item: at a
                  time; -2 retains color on redirect/piping (to less -R); -3 removes configuration
                  value; 0 or -Y sets to detected terminal height. Greater than 0 shows x lines at
                  a time.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Extra Data Options:
 -a, --admin      Adds advanced sys admin data (only works with verbose or line output, not short
                  form); check man page for explanations!; also sets --extra=3:
                     -A  If available: list of alternate kernel modules/drivers for device(s);
                         PCIe lanes-max: gen, speed, lanes (if relevant).
                     -C  If available: CPU socket type, base/boost speeds
                         (dmidecode+root/sudo/doas required); Full topology line, with cores,
                         threads, threads per core, granular cache data, smt status; CPU
                         vulnerabilities (bugs); family, model-id, stepping - format: hex
                         (decimal) if greater than 9; microcode format: hex.
                  -d,-D  If available: logical and physical block sizes; drive family; maj:min,
                         USB drive specifics; SMART report.
                     -E  If available: in Report:, adds Info: line: acl-mtu, sco-mtu, link-policy,
                         link-mode, service-classes.
                     -G  PCIe lanes-max: gen, speed, lanes (if relevant); list of alternate kernel
                         modules/drivers for device(s) (if available); Monitor built year, gamma,
                         screen ratio (if available).
                     -I  As well as per package manager counts, also adds total number of lib
                         files found for each package manager if not -r; adds init service tool.
               -j,-p,-P  For swap (if available): swappiness and vfs cache pressure, and if values
                         are default or not.
                     -L  LV, Crypto, devices, components: add maj:min; show full device/components
                         report (speed, mapped names).
                  -n,-N  If available: list of alternate kernel modules/drivers for device(s);
                         PCIe lanes-max: gen, speed, lanes (if relevant).
                     -o  If available: maj:min of device.
                  -p,-P  If available: raw size of partitions, maj:min, percent available for
                         user, block size of file system (root required).
                     -r  Packages, see -Ia.
                     -R  mdraid: device maj:min; per component: size, maj:min, state.
                     -S  If available: kernel boot parameters.

 -x, --extra      Adds the following extra data (only works with verbose or line output, not short
                  form):
                     -A  Specific vendor/product information (if relevant); PCI/USB ID of device;
                         Version/port(s)/driver version (if available); non-running sound servers.
                     -B  Current/minimum voltage, vendor/model, status (if available); attached
                         devices (e.g. wireless mouse, keyboard, if present).
                     -C  L1/L3 cache (if most Linux, or if root and dmidecode installed); smt if
                         disabled, CPU flags (short list, use -f to see full list); Highest core
                         speed (if > 1 core); CPU boost (turbo) enabled/disabled, if present;
                         Bogomips on CPU; CPU microarchitecture + revision (if found, or unless
                         --admin, then shows as 'stepping').
                     -d  Extra optical drive features data; adds rev version to optical drive.
                     -D  HDD temp with disk data. Kernels >= 5.6: enable module drivetemp if not
                         enabled. Older systems require hddtemp, run as as superuser, or as user
                         if you have added hddtemp to /etc/sudoers (sudo v. 1.7 or newer)(or try
                         doas). Example: <username> ALL = NOPASSWD: /usr/sbin/hddtemp
                     -E  PCI/USB Bus ID of device, driver version, LMP version.
                     -G  Specific vendor/product information (if relevant); PCI/USB ID of device;
                         Direct rendering status (in X); Screen number GPU is running on (Nvidia
                         only).
                     -i  For IPv6, show additional scope addresses: Global, Site, Temporary,
                         Unknown. See --limit for large counts of IP addresses.
                     -I  Default system GCC. With -xx, also shows other installed GCC versions. If
                         running in shell, not in IRC client, shows shell version number, if
                         detected. Init/RC type and runlevel (if available). Total count of all
                         packages discovered in system and not -r.
                     -j  Add mapped: name if partition mapped.
                     -J  For Device: driver.
                     -L  For VG > LV, and other Devices, dm:
    -m,--memory-modules  Max memory module size (if available), device type.
                     -N  Specific vendor/product information (if relevant); PCI/USB ID of device;
                         Version/port(s)/driver version (if available).
               -o,-p,-P  Add mapped: name if partition mapped.
                     -r  Packages, see -Ix.
                     -R  md-raid: second RAID Info line with extra data: blocks, chunk size,
                         bitmap (if present). Resync line, shows blocks synced/total blocks.
                         Hardware RAID driver version, bus-ID.
                     -s  Basic voltages (ipmi, lm-sensors if present): 12v, 5v, 3.3v, vbat.
                     -S  Kernel gcc version; system base of distro (if relevant and detected)
                     -t  Adds memory use output to CPU (-xt c), and CPU use to memory (-xt m).
                  -w,-W  Wind speed and direction, humidity, pressure, and time zone, if
                         available.

-xx, --extra 2    Show extra, extra data (only works with verbose or line output, not short form):
                     -A  Chip vendor:product ID for each audio device; PCIe speed, lanes (if
                         found).
                     -B  Serial number.
                     -D  Disk transfer speed; NVMe lanes; Disk serial number; LVM volume group
                         free space (if available); disk duid (some BSDs).
                     -E  Chip vendor:product ID, LMP subversion; PCIe speed, lanes (if found).
                     -G  Chip vendor:product ID for each video device; Output ports, used and
                         empty; PCIe speed, lanes (if found); Xorg: OpenGL compatibility version,
                         if free drivers and available; Xorg compositor; alternate Xorg drivers
                         (if available. Alternate means driver is on automatic driver check list
                         of Xorg for the device vendor, but is not installed on system); Xorg
                         Screen data: ID, s-res, dpi; Monitors: ID, position (if > 1), resolution,
                         dpi, model, diagonal.
                     -I  Other detected installed gcc versions (if present). System default
                         runlevel. Adds parent program (or pty/tty) for shell info if not in IRC.
                         Adds Init version number, RC (if found). Adds per package manager
                         installed package counts if not -r.
               -j,-p,-P  Swap priority.
                     -J  Vendor:chip-ID.
                     -L  Show internal LVM volumes, like raid image/meta volumes; for LVM RAID,
                         adds RAID report line (if not -R); show all components > devices, number
                         of 'c' or 'p' indicate depth of device.
    -m,--memory-modules  Manufacturer, part number; single/double bank (if found).
                     -M  Chassis info, BIOS ROM size (dmidecode only), if available.
                     -N  Chip vendor:product ID; PCIe speed, lanes (if found).
                     -r  Packages, see -Ixx.
                     -R  md-raid: Superblock (if present), algorithm. If resync, shows progress
                         bar. Hardware RAID Chip vendor:product ID.
                     -s  DIMM/SOC voltages (ipmi only).
                     -S  Display manager (dm) in desktop output (e.g. kdm, gdm3, lightdm); active
                         window manager if detected; desktop toolkit, if available
                         (Xfce/KDE/Trinity only).
                --slots  Slot length.
                  -w,-W  Snow, rain, precipitation, (last observed hour), cloud cover, wind chill,
                         dew point, heat index, if available.

-xxx, --extra 3   Show extra, extra, extra data (only works with verbose or line output, not short
                  form):
                     -A  Serial number, class ID.
                     -B  Chemistry, cycles, location (if available).
                     -C  CPU voltage, external clock speed (if root and dmidecode installed); smt
                         status, if available.
                     -D  Firmware rev. if available; partition scheme, in some cases; disk type,
                         rotation rpm (if available).
                     -E  Serial number, class ID, HCI version and revision.
                     -G  Device serial number, class ID; Xorg Screen size, diag; Monitors: hz,
                         size, modes, serial, scale, modes (max/min).
                     -I  For 'Shell:' adds ([doas|su|sudo|login]) to shell name if present; adds
                         default shell+version if different; for 'running in:' adds (SSH) if SSH
                         session; adds wakeups: (from suspend) to Uptime.
                     -J  If present: Devices: serial number, interface count; USB speed; max
                         power.
    -m,--memory-modules  Width of memory bus, data and total (if present and greater than data);
                         Detail for Type, if present; module voltage, if available; serial number.
                     -N  Serial number, class ID.
                     -R  zfs-raid: portion allocated (used) by RAID devices/arrays. md-raid:
                         system md-raid support types (kernel support, read ahead, RAID events).
                         Hardware RAID rev, ports, specific vendor/product information.
                     -S  Panel/tray/bar/dock info in desktop output, if in X (like lxpanel,
                         xfce4-panel, mate-panel); (if available) dm version number, window
                         manager version number, virtual terminal number.
                  -w,-W  Location (uses -z/irc filter), weather observation time, altitude,
                         sunrise/sunset, if available.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Additional Options:
 -h, --help       This help menu.
     --recommends Checks inxi application dependencies + recommends, and directories, then shows
                  what package(s) you need to install to add support for that feature.
 -V, --version    Prints inxi version info then exits.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Advanced Options:
     --alt        Trigger for various advanced options:
                     40  Bypass Perl as a downloader option.
                     41  Bypass Curl as a downloader option.
                     42  Bypass Fetch as a downloader option.
                     43  Bypass Wget as a downloader option.
                     44  Bypass Curl, Fetch, and Wget as downloader options. Forces Perl if
                         HTTP::Tiny present.
     --bt-tool    [bt-adapter|hciconfig|rfkill] Force use of given tool for bluetooth report.
     --dig        Overrides configuration item NO_DIG (resets to default).
     --display    [:[0-9]] Try to get display data out of X (default: display 0).
     --dmidecode  Force use of dmidecode data instead of /sys where relevant (e.g. -M, -B).
     --downloader Force inxi to use [curl|fetch|perl|wget] for downloads.
     --force      [dmidecode|hddtemp|lsusb|meminfo|usb-sys|vmstat|wmctrl]. 1 or more in comma
                  separated list. Force use of item(s). See --hddtemp, --dmidecode, --wm,
                  --usb-tool, --usb-sys.
     --hddtemp    Force use of hddtemp for disk temps.
     --html-wan   Overrides configuration item NO_HTML_WAN (resets to default).
     --no-dig     Skip dig for WAN IP checks, use downloader program.
     --no-doas    Skip internal program use of doas features (not related to starting inxi with
                  doas).
     --no-html-wan
                  Skip HTML IP sources for WAN IP checks, use dig only, or nothing if --no-dig.
     --no-ssl     Skip SSL certificate checks for all downloader actions
                  (Wget/Fetch/Curl/Perl-HTTP::Tiny).
     --no-sudo    Skip internal program use of sudo features (not related to starting inxi with
                  sudo).
     --pkg        Force use of disabled package manager counts for packages feature. RPM disabled
                  by default due to possible massive rpm package query times.
     --sensors-default
                  Removes configuration item SENSORS_USE and SENSORS_EXCLUDE. Same as default
                  behavior.
     --sensors-exclude
                  [sensor[s] name, comma separated] Exclude supplied sensor array[s] for -s output
                  (lm-sensors, Linux only).
     --sensors-use
                  [sensor[s] name, comma separated] Use only supplied sensor array[s] for -s
                  output (lm-sensors, Linux only).
     --sleep      [0-x.x] Change CPU sleep time, in seconds, for -C (default: 0.35). Allows system
                  to catch up and show a more accurate CPU use. Example: inxi -Cxxx --sleep 0.15
     --tty        Forces irc flag to false. Generally useful if inxi is running inside of another
                  tool like Chef or MOTD and returns corrupted color codes. Please see man page or
                  file an issue if you need to use this flag. Must use -y [width] option if you
                  want a specific output width. Always put this option first in an option list.
                  See -Z for disabling output filters as well.
     --usb-sys    Force USB data to use only /sys as data source (Linux only).
     --usb-tool   Force USB data to use lsusb as data source [default] (Linux only).
     --wan-ip-url [URL] Skips dig, uses supplied URL for WAN IP (-i). URL output must end in the
                  IP address. See man. Example: inxi -i --wan-ip-url https://yoursite.com/ip.php
     --wm         Force wm: to use wmctrl as data source. Default uses ps.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Debugging Options:
     --dbg        [1-xx] Specific debuggers, change often. See man page.
                      1  Show downloader output. Turns off quiet mode.
     --debug      [1-3|10|11|20-22] Triggers debugging modes.
                    1-3  On screen debugger output.
                     10  Basic logging.
                     11  Full file/system info logging.
                  The following create a tar.gz file of system data, plus inxi output. To
                  automatically upload debugger data tar.gz file to ftp.smxi.org: inxi --debug 21
                     20  Full system data collection: /sys; xorg conf and log data, xrandr, xprop,
                         xdpyinfo, glxinfo etc.; data from dev, disks, partitions, etc.
                     21  Upload debugger dataset to inxi debugger server automatically, removes
                         debugger data directory, leaves tar.gz debugger file.
                     22  Upload debugger dataset to inxi debugger server automatically, removes
                         debugger data directory and debugger tar.gz file.
     --debug-id   [short-string] Add given string to debugger file name. Helps identify source of
                  debugger dataset. Use with --debug 20-22.
     --debug-proc Force debugger parsing of /proc as sudo/doas/root.
     --debug-proc-print
                  To locate file that /proc debugger hangs on.
     --debug-no-exit
                  Skip exit on error to allow completion.
     --debug-no-proc
                  Skip /proc debugging in case of a hang.
     --debug-no-sys
                  Skip /sys debugging in case of a hang.
     --debug-sys  Force PowerPC debugger parsing of /sys as sudo/doas/root.
     --debug-sys-print
                  To locate file that /sys debugger hangs on.
     --ftp        Use with --debugger 21 to trigger an alternate FTP server for upload.
                  Format: [ftp.xx.xx/yy]. Must include a remote directory to upload to.
                  Example: inxi --debug 21 --ftp ftp.myserver.com/incoming
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```
