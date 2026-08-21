# Bind Mounts

- What's Bind Mount? Bind mounts may be stored anywhere on the host system. You can create a file on the host system and attach it to the container where you want to maintain the state of the Docker.
- When we use bind mount? Use Bind Mounts when:
1. Development with live reload.
2. Configuration files.
3. Log file access.
4. Development tools and IDEs.
- Example of Bind mounting:
1. Create a volume:
```Bash
docker volume create postgres-data
```
2. Create PostgreSQL container:
```Bash
docker run -d \
--name minishop-postgres \
-e POSTGRES_PASSWORD=devpass \
-e POSTGRES_DB=minishop \
-v postgres-data:/var/lib/posgresql/data \
postgres:16
```
3. Check it:
```Bash
docker ps
```
4. And:
```Bash
docker logs minishop-postgres
```
5. Enter to PostgreSQL:
```Bash
docker exec -it minishop-postgres \
psql -U postgres -d minishop
```
6. Create a simple table:
```SQL
CREATE TABLE products (
id SERIAL PRIMARY KEY,
name VARCHAR(100)
);
```
7. Than:
```SQL
INSERT INTO products (name)
VALUES ('keyboard');
```
8. And:
```SQL
SELECT * FROM products;
```
9. Exit from PostgreSQL:
```SQL
\q
```
10. Important part:
```Bash
docker rm -f minishop-postgres
```
11. Create container again with the same Volume:
```Bash
docker run -d \
--name minishop-postgres \
-e POSTGRES_PASSWORD=devpass \
-e POSTGRES_DB=minishop \
-v postgres-data:/var/lib/postgresql/data \
postgres:16
```
12. Again:
```Bash
docker exec -it minishop-postgres \
psql -U postgres -d minishop
```
13. And:
```SQL
SELECT * FROM products;
```
If see `keyboard` means Database Persistence runs very good.
- What's the difference between Bind mount & Named volume?

| Feature | Named Volume | Bind Mount |
| :-----: | :----------: | :------: |
| Managed by | Docker | User/Host |
| Host path | Docker manages it | You choose it |
| Portability | Better | More host-dependent |
| Dev use | Good | Excellent |
| Database | Usually Preferred | Sometimes used |
Direct Host access | Less direct | Direct |

