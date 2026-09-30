# MiniShop Logging

## 1. Logging Architecture

```
MiniShop has several services, and each service produces logs for a different layer of the application.

                    Client
                       |
                       v
                  +---------+
                  |  Nginx  |
                  +---------+
                       |
                 HTTP request
                       |
                       v
                 +-----------+
                 |  Backend  |
                 | Node.js   |
                 +-----------+
                       |
                  DB requests
                       |
                       v
                +-------------+
                | PostgreSQL  |
                +-------------+

        Logs from each service
             |      |      |
             v      v      v
          Nginx  Backend  PostgreSQL
             \      |      /
              \     |     /
               +---------+
               | Docker  |
               | Logging |
               +---------+
                    |
                    v
             docker compose logs
```

## 2. Docker Logs

### 1. `docker logs`

Like:
```Bash
sudo docker logs minishop-backend
```
But if log be a lot:
```Bash
sudo docker logs --tail 100 minishop-backend
```

### 2. Follow Logs

For live logs:
```Bash
sudo docker logs -f minishop-backend
```
-f means:
```
follow
```
Like:
```Bash
tail -f
```
For exit:
```
Ctrl + c
```

### 3. Compose logs

In MiniShop:
```Bash
sudo docker compose logs backend
```
Or:
```Bash
docker compose logs -f backend
```

### 4. Multiple simultaneous services

Like:
```Bash
sudo docker compose logs -f nginx backend
```
This is very practical.
You can see the chain:
```
Nginx
  ↓
Backend
```

### 5. The last 100 lines

```Bash
sudo docker compose logs --tail=100 backend
```
This is better for incident response from:
```Bash
docker compose logs backend
```
Because you'll probably get a few million lines.

### 6. Timestamp

```Bash
sudo docker compose logs -t backend --tail=100
```
Or:
```Bash
sudo docker logs -t minishop-backend --tail 100
```
This gives you a more clearly timestamp.

### 7. Since

For example logs from 30 minutes ago:
```Bash
sudo docker compose logs --since 30m backend
```
Or:
```Bash
sudo docker compose logs --since "2026-09-28T08:00:00"
```

### 8. Until

For example:
```
docker compose logs \
  --since 09:00 \
  --until 10:00 \
  backend
```
### 9. Filter logs

You can give the output to `grep`:
```Bash
sudo docker compose logs backend | grep -i error
```
Or:
```Bash
sudo docker compose logs backend | grep -i database
```
Or:
```Bash
sudo docker compose logs backend | grep -Ei 'error|warn|fatal'
```

## 3. Nginx Access Logs

HTTP requests:
```
GET /health
GET /
POST /api/orders
```

## 4. Nginx Error Logs

Nginx problems:
```
upstream connection failed
502 Bad Gateway
```

## 5. Backend Logs

Our current Node application should provide appropriate operational information.

Like:
```
Server started on port 3000
```
But for production, it's better to have a request/error context.

Like:
```
2026-09-28T10:30:00Z INFO request GET /health
2026-09-28T10:30:00Z INFO response 200
```

It doesn't need to install a complex logging framework today.
Current target:
> Understand the flow.

## 6. PostgreSQL Logs

Check:
```Bash
sudo docker compose logs postgres --tail=100
```
Look for stuffs like:
```
database system is ready to accept connections
```
Or:
```
FATAL
ERROR
PANIC
connection refused
```
Like:
```Bash
docker compose logs postgres | grep -Ei 'fatal|error|panic|refused'
```

## 7. Log Levels

You should recognize these:
```
DEBUG
INFO
WARN
ERROR
FATAL
```

#### DEBUG

Details for troubleshooting.
```
DEBUG connecting to postgres
```

#### INFO

A normal incident:
```
INFO server started
```

#### WARN

Potential problem:
```
WARN connection pool is almost full
```

#### ERROR

A real error:
```
ERROR database query failed
```

#### FATAL

An error that prevents the application from continuing.

## 8. Log Rotation

Suppose:
```
10 MB/hour
```
Log be created.

In a day:
```
240 MB
```
In a month:
```
~7.2 GB
```
And in Production it may be much more.

The resault:
```
Disk Full
   ↓
Database problems
   ↓
Application problems
   ↓
Production incident
```

## 9. Troubleshooting

When an HTTP request fails, investigate the logs from the layer where the failure appears.

For example:
```
HTTP 502
   |
   v
Nginx error logs
   |
   v
Backend status/logs
   |
   v
Backend -> PostgreSQL only if the evidence indicates a database problem

For an HTTP 500 error:

HTTP 500
   |
   v
Backend application logs
   |
   v
Identify the actual error
   |
   +---- Application problem
   |
   +---- Database/dependency problem
             |
             v
       PostgreSQL logs
```
The troubleshooting principle is:

> Do not guess. Start with the symptom, collect logs from the relevant layer, and follow the evidence toward the root cause.

## 10. Production Considerations

Do log:
```
Timestamp
Severity
Service
Useful context
Error context
Request context
```
Don't log:
```
Passwords
API keys
Tokens
Private credentials
Sensitive secrets
```
