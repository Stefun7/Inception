# Developer Documentation

## Prerequisites

Install:
- Docker
- Docker Compose
- Make

A Linux environment is recommended.
(I left some comments in case you want to make it work on XOS though)

## Setup

Clone the repository:

git clone https://github.com/Stefun7/Inception.git Inception
cd inception

Create the environment file:
srcs/.env

Add required configuration values:
- Domain name.
- Database name.
- Database user/password.
- Other service variables.

Sensitive information should not be stored directly in Dockerfiles.

## Build and Launch

Build and start the project:
make
or:
docker compose -f srcs/docker-compose.yml up --build

Stop the project:
docker compose down

## Container Management

List running containers:
docker ps

View logs:
docker compose logs


Restart services:
docker compose restart


Remove containers:
docker compose down


## Volumes and Data

Persistent data is stored in Docker volumes.

Volumes contain:
- WordPress website files.
- MariaDB database files.

List volumes:
docker volume ls

Remove unused volumes:
docker volume prune

Data remains available after restarting containers because it is stored outside the containers.