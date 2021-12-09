# Install the .NET on Ubuntu

[Install the .NET SDK or the .NET Runtime on Ubuntu](https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu "docs.microsoft.com")

See which versions are installed:
```bash
dotnet --list-sdks
dotnet --list-runtimes
```

Fresh install - No prior WSL installation:
```
wsl --install -d Ubuntu
```

Existing WSL install:
```
wsl --update
wsl --shutdown
```

Install Linux GUI apps:
```
sudo apt update
sudo apt install gedit -y
sudo apt install gimp -y
sudo apt install nautilus -y
sudo apt install vlc -y
```

Run Linux GUI apps:
```
gedit ~/.bashrc
gimp
nautilus
vlc
```
