https://hub.docker.com/r/bitnami/redmine/

docker pull bitnami/redmine

Step 1: Create a network
$ docker network create redmine-network

Step 2: Create a volume for MariaDB persistence and create a MariaDB container
$ docker volume create --name mariadb_data
$ docker run -d --name mariadb --env ALLOW_EMPTY_PASSWORD=yes --env MARIADB_USER=bn_redmine --env MARIADB_PASSWORD=bitnami --env MARIADB_DATABASE=bitnami_redmine --network redmine-network --volume mariadb_data:/bitnami/mariadb bitnami/mariadb:latest

Step 3: Create volumes for Redmine persistence and launch the container
$ docker volume create --name redmine_data
$ docker run -d --name redmine -p 8080:8080 -p 8443:8443 --env ALLOW_EMPTY_PASSWORD=yes --env REDMINE_DATABASE_USER=bn_redmine --env REDMINE_DATABASE_PASSWORD=bitnami --env REDMINE_DATABASE_NAME=bitnami_redmine --network redmine-network --volume redmine_data:/bitnami/redmine bitnami/redmine:latest

Access your application at http://your-ip/
