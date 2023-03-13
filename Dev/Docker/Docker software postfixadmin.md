# Docker software postfixadmin

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back to the README page](README.md)

## Links
- [postfixadmin](https://hub.docker.com/_/postfixadmin)

## Docker commands
```
docker pull postfixadmin
docker run \
	-e POSTFIXADMIN_DB_TYPE=mysqli \
    -e POSTFIXADMIN_DB_HOST=whatever \
    -e POSTFIXADMIN_DB_USER=user \
    -e POSTFIXADMIN_DB_PASSWORD=topsecret \
    -e POSTFIXADMIN_DB_NAME=postfixadmin \
    --name some-postfixadmin \
	-p 8080:80
    postfixadmin
```
