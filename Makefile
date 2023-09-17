### stop-container
stop-container:
	docker stop client server mongo \
	&& docker rm client server mongo \
	&& clear

### clear-client
clear-client:
	docker rmi higoreduardodocs/docker-mern-client \
	&& docker system prune && clear

### clear-all
clear-all:
	docker rmi higoreduardodocs/docker-mern-client \
	&& docker rmi higoreduardodocs/docker-mern-server \
	&& docker system prune && clear

### run-dev
run-dev:
	docker compose \
		-f docker-compose.yml \
		-f docker-compose.dev.yml \
		up -d \
	&& clear \
	&& docker ps

### down-dev
down-dev:
	docker compose \
		-f docker-compose.yml \
		-f docker-compose.dev.yml \
		down \
	&& clear \
	&& docker ps

### run-local
run-local:
	SERVER_URL=http://localhost/api/v1 NGINXFILE=nginx.local.conf MONGO_USER=admin MONGO_PASS=admin \
		docker compose \
		-f docker-compose.yml \
		-f docker-compose.prod.yml \
		up -d \
	&& clear \
	&& docker ps

### swarm-local
swarm-local:
	SERVER_URL=http://172.30.86.36/api/v1 NGINXFILE=nginx.local.conf MONGO_USER=admin MONGO_PASS=admin \
		docker stack deploy \
		-c docker-compose.yml \
		-c docker-compose.prod.yml \
		swarmapp \
	&& docker service ls

### leave-swarm
leave-swarm:
	docker swarm leave -f && clear

### scale-local
scale-local:
	SERVER_URL=http://localhost/api/v1 NGINXFILE=nginx.local.conf MONGO_USER=admin MONGO_PASS=admin \
		docker compose \
		-f docker-compose.yml \
		-f docker-compose.prod.yml \
		up -d --scale server=2 \
	&& clear \
	&& docker ps

### down-local
down-local:
	SERVER_URL=http://localhost/api/v1 NGINXFILE=nginx.local.conf MONGO_USER=admin MONGO_PASS=admin \
		docker compose \
		-f docker-compose.yml \
		-f docker-compose.prod.yml \
		down \
	&& clear \
	&& docker ps

### run-prod
run-prod:
	SERVER_URL=localhost/api/v1 NGINXFILE=nginx.prod.conf MONGO_USER=admin MONGO_PASS=admin \
		docker compose \
		-f docker-compose.yml \
		-f docker-compose.prod.yml \
		up -d \
	&& clear \
	&& docker ps