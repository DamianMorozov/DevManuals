# Docker software linuxserver jellyfin

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back to the README page](README.md)

## Links
- [linuxserver/jellyfin](https://hub.docker.com/r/linuxserver/jellyfin)

## Docker commands
```
docker pull linuxserver/jellyfin
docker run -d \
  --name jellyfin \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e JELLYFIN_PublishedServerUrl=192.168.x.y `#optional` \
  -p 8096:8096 \
  -p 8920:8920 `#optional` \
  -p 7359:7359/udp `#optional` \
  -p 1900:1900/udp `#optional` \
  -v /path/to/library:/config \
  -v /path/to/tvseries:/data/tvshows \
  -v /path/to/movies:/data/movies \
  --restart unless-stopped \
  --mount type=bind,source=/mnt/<location>,target=/mnt/<location> \
  lscr.io/linuxserver/jellyfin:latest
```
