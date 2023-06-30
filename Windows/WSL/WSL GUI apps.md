# WSL GUI apps on the Windows

- [Back to the Home page](../../README.md)
- [Back to the Windows page](../README.md)
- [Back to the README page](README.md)

## Links
- [Run Linux GUI apps on the Windows Subsystem for Linux (preview)](https://docs.microsoft.com/en-us/windows/wsl/tutorials/gui-apps)

See which versions are installed
```bash
dotnet --list-sdks
dotnet --list-runtimes
```

Fresh install - No prior WSL installation
```
wsl --install -d Ubuntu
```

Existing WSL install
```
wsl --update
wsl --shutdown
```

Install Linux GUI apps
```
sudo apt update
sudo apt install gedit -y
sudo apt install gimp -y
sudo apt install nautilus -y
sudo apt install vlc -y
```

Run Linux GUI apps
```
gedit ~/.bashrc
gimp
nautilus
vlc
```
