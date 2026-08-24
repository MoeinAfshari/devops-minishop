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
