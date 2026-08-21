# Docker Volumes

- What's Volume? Docker Volumes are persistent storage mechanisms managed by Docker that allows containers to retain data beyond their lifecycle.
- Why do we use it? This ensures data remains intact even if the container is stopped, removed, or recreated.
- What's Named Volume? Named Volume is a type of Docker volumes that stores persistent data. Docker manages this storage and it creates with `docker volume create volume_name`.
- What's Volume lifecycle? Unlike a container, which has a specific lifecylcle that ends when it's stopped or removed, a volume's lifecycle is independent of any paricular container. This means that the data stored in a volume persists beyond the container that uses it, making it ideal for retaining important iformation like databases, configuration files, or logs.
- `docker volume create` -> This is created a new named volume.
- `docker volume inspect` -> This command gives some information about a volume.
- `docker volume ls` -> This command shows all my volumes.
