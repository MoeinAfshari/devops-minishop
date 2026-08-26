# Docker Compose

## What is Docker Compose?

Docker Compose is a lightweight orchestration tool for defining and running multi-container Docker applications. It allows you to configure and manage services together as a single application using one docker-compose.yml file.

## Compose File

A Docker Compose file is a YAML file that defines all the services you wanna run, how they connect, and what they need to start reliably; Compose file is configuration-driven.

## Services 

A service is a declarative definition of a containerized application component in the Compose file, including its image or build configuration, ports, networks, volumes, environment, and other settings.

## Networks

Docker Compose deployments use networks to allow secure communications between the services. Services defined in a docker-compose.yml file are by default placed on one network and are able to connect to each other without any aditional setup.

## Volumes

Volumes in docker compose are used to persist data created or used by the docker containers. By doing so they enable the data to persist even if containers are stopped or removed in your docker-compose.

## Environment Variables

Environment variables are a simple and effective way to pass configuration settings from your host operating system through Docker Compose in order to get to your services.

## depends_on

`depends_on` shows an ordering. When a  service is depends on another service, that another service will run in the first & than this service will run.

```Bash
depends_on
    ↓
start order ✅
```

## `depends_on` + Healthcheck

Sometimes we need to run one service after another and test its health.
So we can use `depends_on` in two ways:
1. `depends_on`:
```YAML
depends_on:
  - postgres
```
Workflow:
```Bash
PostgreSQL starts
   ↓
Backend starts
```
2. `depends_on` + Healthcheck:
```YAML
depends_on:
  postgres:
    condition: service_healthy
```
Workflow:
```Bash
PostgreSQL starts
   ↓
Healthcheck passes
   ↓
Backend starts
```
This way is useful when we need to start a health service, no just start a service.

## Restart Policies

A Docker Compose restart policy is a configuration setting for Docker to use in dtermining how to restart containers that have stopped or failed.

### Types of Restart policies

- no: It will not be automatically restarted if it stops. This is the default behavior unless a restart policy has been specified.
- always: The container will be restarted always, no matter the exit status. This ensures maximum service availability and suits only the critical services that must not fail.
- on-failure: This will restart the container only if it has exited with a non-zero exit code, hence encountering an error. This is useful for services that should be restarted only when they experience failure.
- unless-stopped: This will restart the container unless it is explicitly stopped or Docker itself is stopped or restarted. This policy is the same as always but allows for manual intervention to stop the container without it automatically restarting.

Example:
```YAML
 db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: example
    restart: on-failure
```

## Common Commands

- `docker compose up`
- `docker compose up -d`
- `docker compose down`
- `docker compose ps`
- `docker compose logs`
- `docker compose logs -f`
- `docker compose exec`
- `docker compose build`
- `docker compose pull`
- `docker compose restart`
- `docker compose config`

## MiniShop Compose Architecture

```Bash
                    Docker Compose
                         │
              ┌──────────┴──────────┐
              │                     │
              ▼                     ▼
        Backend Service       PostgreSQL Service
           :3000                   :5432
              │                     │
              └──────────┬──────────┘
                         │
                    Compose Network
                         │
                         ▼
                  postgres-data
                      Volume
```

```Bash
Backend
   │
   │ DB_HOST=postgres
   │ DB_PORT=5432
   ▼
postgres:5432
```
