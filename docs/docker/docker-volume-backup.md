# Docker Volume Backup

## Volume Backup

Get backup from volume:

```Bash
docker run --rm \
-v postgres-data:/source:ro \
-v "$(pwd)":/backup \
alpine \
tar czf /backup/postgres-volume.tar.gz -C /source .
```
**What each part does**
- docker run — starts a temporary container.
- --rm — automatically deletes the container when the command finishes.
- -v postgres-data:/source:ro — mounts your Docker volume named postgres-data into the container at /source.
- :ro means read-only, so the backup process can't modify the volume.
- -v "$(pwd)":/backup — mounts your current host directory into the container at /backup.
- alpine — uses a small Alpine Linux image.
- tar czf ... — creates the archive:
  - c = create archive
  - z = gzip compression
  - f = output to the specified file
- /backup/postgres-volume.tar.gz — where the backup is written.
- -C /source . — tells tar to change into /source and archive everything (.).

**Important: PostgreSQL should be stopped before get backup, and be started after that.**

## Volume Restore

We restore backup now:

```Bash
docker volume create postgres-data
```
And:
```Bash
docker run --rm \
  -v postgres-data:/target \
  -v "$(pwd)":/backup \
  alpine \
  tar xzf /backup/postgres-volume.tar.gz -C /target
```

Backup: volume -> tar.gz
Restore: tar.gz -> volume

## Risks

1. The biggest risk: inconsistent data.
Suppose PostgreSQL is actively writing to the database while you copy the volume:
```Bash
PostgreSQL
   ↓
writes data
   ↓
Docker volume ← you copy this NOW
```
You could capture some files before a write and other files after the write.

The resulting volume backup may be inconsistent or corrupted.

2. Volume restore can overwrite good data
Imagine you currently have:
```Bash
Database
├── 1,000 users
├── 5,000 products
└── 20,000 orders
```
You restore an old volume backup containing:
```Bash
Database
├── 800 users
├── 4,000 products
└── 15,000 orders
```
You've just potentially replaced newer data with an older state.

So before restoring, you should normally make another backup of the current database.

3. PostgreSQL version compatibility
This is an important one.

A physical PostgreSQL data directory inside a Docker volume is tied to PostgreSQL's storage format.

4. Docker volume ≠ portable database backup
5. You can accidentally back up the wrong thing
With Docker, it's easy to think:
```Bash
postgres container
      +
postgres volume
      =
complete backup
```
But your application may have other important things:
```Bash
PostgreSQL volume
Application files
Uploaded images
.env/configuration
Docker Compose configuration
Secrets/certificates
```
Backing up only the PostgreSQL volume doesn't necessarily give you a complete disaster-recovery solution.


