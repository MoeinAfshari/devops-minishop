# PostgreSQL Backup & Recovery

## 1. Backup Strategy

```
                    PostgreSQL
                        │
                        ▼
                     pg_dump
                        │
                        ▼
                  Backup Artifact
                        │
              ┌─────────┴─────────┐
              ▼                   ▼
           Checksum           pg_restore -l
              │                   │
              └─────────┬─────────┘
                        ▼
                 Restore to Test DB
                        │
                        ▼
                   Validation
                        │
                        ▼
               Recovery is proven
```

## 2. pg_dump

This tool exports data and structure of a database.
Like:
```BASH
docker compose exec -T postgres \
  sh -c 'pg_dump -U minishop minishop' \
  > backend.sql
```

## 3. Backup Formats

1. Plain SQL: It's readable, inspectable, simple and suitable for teaching and simple backups.
Like:
```SQL
pg_dump minishop > backup.sql
```
2. Custom Format: It's flexible, selective restore option and usually more suitable for professional recovery operations.
Like:
```SQL
pg_dump -Fc minishop > backup.dump
```

## 4. Backup Naming

Backup naming usually has created date and time like `minishop_20260926_103500.dump`.
Template:
```Bash
backups/minishop_$(date +%Y%m%d_%H%M%S).dump
```

## 5. Checksum Verification

Create a checksum for every backup:
```Bash
sha256sum backups/*.dump
```
Like:
```
7b1...  backups/minishop_20260926_103500.dump
```
This helps you to understand:
> Is the backup file the same as the one previously created?

how can I understand?

```Bash
echo "<expected-sha-256-sum>  <name-of-the-file>" | sha256sum -c
```

## 6. Restore Procedure

1. Create a new database:
```Bash
sudo docker compose exec -T postgres \
  sh -c 'createdb -U "$POSTGRES_USER" minishop_restore'
```
2. Check it:
```Bash
sudo docker compose exec postgres \
  psql -U postgres -l
```
You should see something like:
```
minishop
minishop_restore
postgres
```
3. Suppose:
```Bash
BACKUP=backups/minishop_20260926_103500.dump
```
Then:
```Bash
sudo docker compose exec -T postgres \
  pg_restore \
  -U minishop \
  -d minishop_restore \
  -F c \
  < "$BACKUP"
```
4. Check restore:
Go to new database:
```Bash
sudo docker compose exec postgres \
  psql -U postgres -d minishop_restore
```
Then:
```SQL
\dt
```
If you have table, should see list of them.
Like:
```
products
users
orders
```
Then:
```SQL
SELECT COUNT(*) FROM products;
```
```SQL
SELECT * FROM products LIMIT 10;
```
And do it for other tables too.
Exit:
```SQL
\q
```
5. Restore from SQL"### 3. Check restore

Go to new database:
```Bash
sudo docker compose exec postgres \
  psql -U postgres -d minishop_restore
```
Then:
```SQL
\dt
```
If you have table, should see list of them.
Like:
```
products
users
orders
```
Then:
```SQL
SELECT COUNT(*) FROM products;
```
```SQL
SELECT * FROM products;
```
And do it for other tables too.
Exit:
```SQL
\q
```

5. Restore from SQL:
For plain text:
```Bash
sudo docker compose exec -T postgres \
  psql \
  -U minishop \
  -d minishop_restore \
  < backups/minishop_....sql
```

## 7. Recovery Drill

```
Incident
   ↓
Identify backup
   ↓
Verify backup
   ↓
Create recovery DB
   ↓
Restore backup
   ↓
Validate data
```

## 8. Retention Policy

Having backups without retention can create problems it itself.
For example if backup every day:
```
Day 1
Day 2
Day3
...
Day 365
```
The disk may be full.
So we should have a policy.

For example:
```
Keep last 7 days
```
We can for Lab:
```Bash
find "$BACKUP_DIR" \
  -type f \
  -name 'minishop_*.dump' \
  -mtime +7 \
  -delete
```

## 9. RPO

RPO (Recovery Point Objective) means maximum acceptable data loss.

For example:
```
RPO = 1
```
This means that the system must have backup/replication in such a way that, in the worst case, no more than an hour of data is lost.

## 10. RTO

RTO (Recovery Time Objective) means the maximum acceptable time for recovery.

For example:
```
Incident: 10:00
Service restored: 11:00
```
So:
```
RTO = 1 hour
```

## 11. Troubleshooting

### Workflow

```
Incident
   ↓
Find backup
   ↓
Verify checksum
   ↓
Inspect archive
   ↓
Create restore DB
   ↓
Restore
   ↓
Validate schema
   ↓
Validate row counts
   ↓
Validate sample data
```

### Problem types

#### A. Can't access backup

```
permission denied
file missing
path wrong
```

#### B. Can't execute restore

```
Docker permission
wrong command
database does not exist
```

#### C. Restore starts but fails

```
existing objects
missing role
missing extension
dependency problem
incompatible environment
restore options
```

## 12. Production Considerations

### Restore Model

```
Restore completed
       ↓
Schema exists
       ↓
Tables exist
       ↓
Row counts look correct
       ↓
Important records are present
       ↓
Application can connect to restored DB
```

### Production prevention

1. Database permissions
2. SQL review
3. Backup
4. Restore testing
5. Point-in-time recovery
6. Operational procedures

