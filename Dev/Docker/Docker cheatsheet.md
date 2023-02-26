# Docker cheatsheet

```
docker container ls					# list containers
docker container ls --all			# list all containers
docker container rm <container>		# remove one or more containers
docker container stats				# display a live stream of container(s) resource usage statistics
docker container stop <container>	# stop one or more running containers
docker image ls						# list images
docker logs --details <container>	# fetch the logs of a container
docker ps -a						# view containers
docker run -d --name devtest --mount source=myvol2,target=/app nginx:latest		# run
docker volume create				# create volume
docker volume create <volume_name>	# create named volume
docker volume inspect <volume>		# display detailed information on one or more volumes
docker volume ls					# list volumes
docker volume rm <volume_name>		# remove one or more volumes
```
