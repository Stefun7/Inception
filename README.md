*This project has been created as part of the 42 curriculum by scesar.*

# Inception

## Description

Inception is a 42 project about Docker, containerization, and system administration.

The goal is to create a small infrastructure using Docker Compose with:
- NGINX as a reverse proxy with TLS.
- WordPress as the CMS.
- MariaDB as the database.

Each service runs in its own container. Dockerfiles are used to create custom images, Docker networks allow communication between services, and volumes provide persistent storage.

Main choices:
- One container per service.
- Isolated services using Docker.
- Persistent data using volumes.
- Secure configuration management.

## Instructions

Requirements:
- Docker
- Docker Compose

Setup:
cd inception
make

The project will build and start all containers.

Access the website:
https://<yourdomain>.com

## Comparisons

### Virtual Machines vs Docker
VMs run a complete operating system and are heavier. Docker containers share the host kernel, making them faster and more lightweight, but slightly less isolated.

### Secrets vs Environment Variables
Environment variables are simple configuration values but can expose sensitive data. Secrets are designed to safely store passwords and private information.

### Docker Network vs Host Network
Docker networks isolate container communication and allow services to communicate privately. Host networking shares the machine's network and provides less isolation.

### Docker Volumes vs Bind Mounts
Volumes are managed by Docker and are better for persistent data. Bind mounts directly use host folders and are mainly useful for development.

## Resources

- Docker Documentation: https://docs.docker.com/
- Docker Compose Documentation: https://docs.docker.com/compose/
- NGINX Documentation: https://nginx.org/en/docs/
- WordPress Documentation: https://wordpress.org/documentation/
- MariaDB Documentation: https://mariadb.com/kb/en/

AI was used as a learning tool to understand Docker concepts, debug issues, and improve documentation.