# Docker software universalmediaserver ums

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back to the README page](README.md)

## Links
- [linuxserver/qbittorrent](https://hub.docker.com/r/linuxserver/qbittorrent)
- [Support](https://support.universalmediaserver.com/books/installation/page/docker)

## Docker commands
```
docker pull universalmediaserver/ums
docker run -d \
  --name ums \
  -p 1044:1044 -p 5001:5001 -p 9001:9001 \
  -v /srv/UMS:/root/media \
  -v "$HOME/.config/UMS":/root/.config/UMS \
  --restart unless-stopped \
  --mount type=bind,source=/mnt/<location>,target=/mnt/<location> \
  universalmediaserver/ums:latest
```
