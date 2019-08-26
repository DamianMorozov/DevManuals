----------------------------------------------------------------------------------------------------
Develop
----------------------------------------------------------------------------------------------------
.NET Core for Ubuntu 18.04
https://dotnet.microsoft.com/download/linux-package-manager/ubuntu18-04/sdk-2.1.301
$ wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
$ sudo dpkg -i packages-microsoft-prod.deb
Install the .NET SDK
$ sudo add-apt-repository universe
$ sudo apt-get install apt-transport-https
$ sudo apt-get update
$ sudo apt-get install dotnet-sdk-2.1
If you receive an error message similar to Unable to locate package dotnet-sdk-2.1, run the following commands.
$ sudo dpkg --purge packages-microsoft-prod && sudo dpkg -i packages-microsoft-prod.deb
$ sudo apt-get update
$ sudo apt-get install dotnet-sdk-2.1
If that doesn't work, you can run a manual install with the following commands
$ sudo apt-get install -y gpg
$ wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
$ sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
$ wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list
$ sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
$ sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
$ sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list
$ sudo apt-get install -y apt-transport-https
$ sudo apt-get update
$ sudo apt-get install dotnet-sdk-2.1
----------------------------------------------------------------------------------------------------
.NET Core for Ubuntu 18.10
https://dotnet.microsoft.com/download/linux-package-manager/ubuntu18-10/sdk-2.1.301
$ wget -q https://packages.microsoft.com/config/ubuntu/18.10/packages-microsoft-prod.deb
$ sudo dpkg -i packages-microsoft-prod.deb
Install the .NET SDK
$ sudo apt-get install apt-transport-https
$ sudo apt-get update
$ sudo apt-get install dotnet-sdk-2.1
----------------------------------------------------------------------------------------------------
$ sudo apt install gtk-sharp2
$ sudo apt install glib-sharp     -- Unable to locate package
$ sudo apt install pango-sharp    -- Unable to locate package
$ sudo apt install atk-sharp      -- Unable to locate package
$ sudo apt install gdk-sharp      -- Unable to locate package
$ sudo apt install glade-sharp    -- Unable to locate package
$ sudo apt install art-sharp      -- Unable to locate package
$ sudo apt install rsvg-sharp     -- Unable to locate package
$ sudo apt install gtk-dotnet     -- Unable to locate package
$ sudo apt install gnome-sharp    -- Unable to locate package
$ sudo apt install gnomevfs-sharp -- Unable to locate package
$ sudo apt install vte-sharp      -- Unable to locate package
$ sudo apt install gconf-sharp    -- Unable to locate package
$ sudo apt install gtkhtml-sharp  -- Unable to locate package
$ sudo apt-get install glade
$ sudo apt-get install libglade2.0-cil libglade2.0-cil-dev
$ sudo apt install libcanberra-gtk-module libcanberra-gtk3-module
----------------------------------------------------------------------------------------------------

