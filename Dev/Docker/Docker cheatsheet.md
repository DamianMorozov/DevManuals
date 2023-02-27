# Docker cheatsheet

## Images
```
docker pull <image>							# pull teh image
docker image ls								# list images
```

## Containers
```
docker container ls							# list containers
docker container ls --all					# list all containers
docker container rm <container>				# remove one or more containers
docker container stats						# display a live stream of container(s) resource usage statistics
docker container stop <container>			# stop one or more running containers
docker ps -a								# view containers
docker run -d --name devtest --mount source=myvol2,target=/app <image>:latest	# create and start container from latest image
docker inspect <container>					# view info about container
```

## Volumes
```
docker volume create						# create volume
docker volume create <volume_name>			# create named volume
docker volume inspect <volume>				# display detailed information on one or more volumes
docker volume ls							# list volumes
docker volume rm <volume_name>				# remove one or more volumes
```

## Networks
```
docker run <container>						# run container with bridge network | default private internal network | 172.17.0.x
docker run <container> --network=none		# run container with none network	| does not have access to any networks
docker run <container> --network=host		# run container with host network	| external network | usage host's ports
docker network ls							# view networks
docker network create <network_name> 		# create user-defined network
docker network create <network_name> --driver bridge --subnet 182.18.0.0/16		# create network with driver and subnet
docker network rm <network_name>			# remove user-defined network
```

## Logs
```
docker logs --details <container>			# fetch the logs of a container
```
