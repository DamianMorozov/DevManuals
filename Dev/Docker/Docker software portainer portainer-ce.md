# Docker software portainer portainer-ce

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back to the README page](README.md)

## Links
- [portainer/portainer-ce](https://hub.docker.com/r/portainer/portainer-ce)

## Docker commands
```
docker pull portainer/portainer-ce
docker volume create portainer_data
docker run -d \
  -p 8000:8000 \
  -p 9443:9443 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest
```
