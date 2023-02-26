# Docker quick start

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back to the README page](README.md)

1. Clone a repo
docker run --name repo apline/git clone https://github.com/docker/getting-started.git
docker cp repo:/git/getting-started/ .
2. Build image
cd getting-started
docker build -t docker101tutorial .
3. Run container
docker run -d -p 80:80 --name docker-tutorial docker101tutorial
4. Share
docker tag docker101tutorial username/docker101tutorial
docker push username/docker101tutorial
