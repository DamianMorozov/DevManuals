# Docker cheatsheet

## Images
```
docker pull <image>							# download the image
docker image ls								# list images
docker images								# list images
docker rmi <image>							# remove the image
```

## Containers
```
docker run <image>							# download the image, create and start the container
docker run -d \
  --name <container> \
  --mount source=/mnt/share,target=/mnt/share \
  <image>:latest							# run the container in background, set name, add mount directory
docker run <image> sleep 5					# run the container for 5 seconds and then go to sleep
docker run <image>:<tag>					# run the container with tag
docker run -it <container> /bin/bash		# to get an interactive shell
docker ps									# list running containers
docker ps -a								# list all containers
docker container ls							# list containers
docker container ls --all					# list all containers
docker container rm <container>				# remove the container
docker rm <container_id>					# remove the container by id
docker rm <container_name>					# remove the container by name
docker container stats						# view a live stream of container(s) resource usage statistics
docker stats								# view a live stream of container(s) resource usage statistics
docker container stop <container>			# stop running container
docker stop <container>						# stop running container
docker container inspect <container>		# view detailed information on one or more container
docker inspect <container>					# view detailed information on one or more container
docker attach <container_hash>				# attach to the container by hash
```

## Volumes
```
docker volume create						# create volume
docker volume create <volume_name>			# create named volume
docker volume inspect <volume>				# view detailed information on one or more volumes
docker volume ls							# list volumes
docker volume rm <volume_name>				# remove one or more volumes
```

## Networks
```
docker run <container>						# run container with bridge network | default private internal network | 172.17.0.x
docker run <container> --network=none		# run container with none network	| does not have access to any networks
docker run <container> --network=host		# run container with host network	| external network | usage host's ports
docker run -p 8000:5000 <web_app>			# run container with external port 8000 and internal port 5000 | port mapping
docker run -p 8306:3306 <mysql>				# run container with external port 8306 and internal port 3306 | port mapping
docker network ls							# view networks
docker network create <network_name> 		# create user-defined network
docker network create <network_name> --driver bridge --subnet 182.18.0.0/16		# create network with driver and subnet
docker network rm <network_name>			# remove user-defined network
docker network inspect <network_name>		# view detailed information on one or more networks
```

## Logs
```
docker logs --details <container>			# fetch the logs of a container
docker logs -f <container>					# to debug the container
```

## Exec commands
```
docker exec <container> <command>			# exec the command into the container
docker exec <container> cat /etc/hosts		# example of exec the command into the container
docker exec -it <container> /bin/bash		# to get an interactive shell
```
