# Docker install on Ubuntu

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back to the README page](README.md)

## Links
- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

## Preview script steps before running
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run
```

## Script steps before running
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

## Uninstall Docker Engine
```
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```

# Linux post-installation steps for Docker Engine

1. Create the docker group
```
sudo groupadd docker
```
2. Add your user to the docker group
```
sudo usermod -aG docker $USER
```
3. Log out and log back in so that your group membership is re-evaluated
4. Verify that you can run docker commands without sudo
```
docker run hello-world
```
Fix `WARNING: Error loading config file: /home/user/.docker/config.json -stat /home/user/.docker/config.json: permission denied`
```
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
```

## Configure Docker to start on boot with systemd
```
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```
To stop this behavior, use disable instead
```
sudo systemctl disable docker.service
sudo systemctl disable containerd.service
```
