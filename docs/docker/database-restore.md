# Database Restore

## Create Database

Create a new database named `restore_test` to restore backup:

```Bash
docker compose exec postgres \
psql -U postgres -c "CREATE DATABASE restore_test;"
```

## Restore SQL

Restore minishop backup on the restore_test database:

```Bash
cat minishop-backup.sql | \
docker compose exec -T postgres \
psql -U postgres -d restore_test
```
OR
```Bash
docker compose exec -T postgres \
psql -U postgres -d restore_test \
< minishop-backup.sql
```

## Verify Data

Verify data with using a table that stored in the minishop database. So the database sould be in the backup file and should be in the new database.

```Bash
docker compose exec postgres \
psql -U postgres -d restore_test \
-c "SELECT * FROM products;"
```
