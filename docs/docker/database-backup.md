# Database Backup

## Why backup?

We use backups because data is valuable, and backups give us a way to recover when something goes wrong.

## pg_dump

The pg_dump command-line utility is the most commonly used method to dump a PostgreSQL database. It creates a logical backup, saving the databasse as a plain-text file or in a custom format.

## Logical Backup

It contains logical data which is retrieved from the database. It contains a view, procedure, function, and table. This is useful When users want to restore or transfer a copy of the database to different location. Logical backups are not as secure as physical backups in preventing data loss. It only provides structural details. Every week, complete logical backups should be performed. Logical backups are used as supplement to physical backup.

## Backup Example

Get backup from minishop database of postgres container and store it in `minishop-backup.sql`:
```Bash
docker compose exec postgres \
pg_dump -U postgres -d minishop > minishop-backup.sql
```

