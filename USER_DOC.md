# User Documentation

## Services

This project provides a web stack composed of:

- **NGINX**: Web server and HTTPS reverse proxy.
- **WordPress**: Website and administration interface.
- **MariaDB**: Database used by WordPress.

## Start and Stop

Start the project:

make
or:
docker compose up -d

Stop the project:
docker compose down

## Access

Website:
https://yourdomain.com

## Credentials

Credentials are stored in the `.env` file.

Example location:
srcs/.env
Do not share this file because it contains sensitive information.

## Checking Services

Check running containers:
docker ps

Check logs:
docker compose logs

Check a specific service:
docker compose logs <service_name>

All services should show as running without errors.