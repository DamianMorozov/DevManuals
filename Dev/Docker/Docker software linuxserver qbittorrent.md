# Docker software linuxserver qbittorrent

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back to the README page](README.md)

## Links
- [linuxserver/qbittorrent](https://hub.docker.com/r/linuxserver/qbittorrent)

## Docker commands
```
docker pull linuxserver/qbittorrent
docker run -d \
  --name qbittorrent \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e WEBUI_PORT=8090 \
  -p 8090:8090 \
  -p 6881:6881 \
  -p 6881:6881/udp \
  --restart unless-stopped \
  -v /mnt/net_media:/mnt/net_media \
  --mount type=bind,source=/mnt/<location>,target=/mnt/<location> \
  linuxserver/qbittorrent:latest
```

## Default access
```
admin : adminadmin
```
