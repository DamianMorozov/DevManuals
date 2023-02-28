# Docker software ubuntu bind9

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back to the README page](README.md)

## Links
- [ubuntu/bind9](https://hub.docker.com/r/ubuntu/bind9)

## Docker commands
```
docker pull ubuntu/bind9
docker run -d \
  --name bind9 \
  -e TZ=UTC \
  -p 30053:53 \
  -e BIND9_USER=bind \
  -v /path/to/bind/configuration:/etc/bind/named.conf \
  v /path/to/cached/data:/var/cache/bind \
  -v /path/to/resource/records:/var/lib/bind \
  ubuntu/bind9:latest
docker logs -f bind9				# to debug the container
docker exec -it bind9 /bin/bash		# to get an interactive shell
```
