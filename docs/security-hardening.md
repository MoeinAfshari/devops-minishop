# MiniShop Security Hardening

## 1. Security Goals

Network security is built on a set of core principles that ensure data safety and system reliability.

1. Confidentaility
2. Authentication
3. Integrity
4. Non-Repudiation
5. Access Control
6. Availability

## 2. Least Privilege

**Principle of Least Privilege:**
> Give a user or process only the permissions it actually needs.

## 3. Linux Users and Permissions

### Linux Users

1. Check the current user:
```Bash
whoami
```
2. Get id, group id, groups, ...:
```Bash
id
```
3. Check system users:
All users:
```Bash
cut -d: -f1 /etc/passwd
```
or:
```Bash
compgen -u
```
Some users that have UID 0:
```Bash
awk -F: '$3 == 0 {print $1}' /etc/passwd
```

### Linux Permissions

1. File permission levels:
```
user
group
other
```
2. Check permissions of `.env` file:
```Bash
ls -l .env
# or
stat .env
```
3. Change a file permissions:
```Bash
chmod 600 .env
```
Just read & write for owner.

## 4. SSH Hardening

**Frist, make sure SSH Key Login is working.**

Because if you turn off password Authentication first and the is broken, you may lock yourself out.

### 1. SSH Test

From Host:
```Bash
ssh deployer@192.168.56.101
# Or
ssh deployer@minishop-deploy
```
If you log in with a key, that's great.
Then:
```Bash
ssh -v deployer@minishop-deploy
```
If there is needed, check the authentication.

### 2. SSH Config

Create a snippet instead of directly modifying the original file:

```Bash
sudo vim /etc/ssh/sshd_config.d/99-minishop-hardening.conf
```
```
PermitRootLogin no
PubkeyAuthentication yes
MaxAuthTries 3
X11Forwarding no
```
And when you verified the key login:
```
PasswordAuthentication no
```

### 3. Too important: First check the syntax

```Bash
sudo sshd -t
```
Then:
```Bash
sudo systemctl reload ssh
```

### 4. Test from a Second terminal

Don't close current SSH session.
Open a new terminal:
```Bash
ssh deployer@192.168.56.20
```
If the login was successful:
```
SSH hardening successful
```
Now you can close the last session.

## 5. Firewall

First:
```Bash
sudo ufw status verbose
```
Befor enable:
```Bash
sudo ufw allow OpenSSH
```
Then if Nginx is public:
```Bash
sudo ufw allow 80/tcp
```
And if HTTPS will add:
```Bash
sudo ufw allow 443/tcp
```
Then:
```Bash
sudo ufw status numbered
```
And when you sure:
```Bash
sudo ufw enable
```

## 6. Docker Security

In our architecture:
```
Internet/LAN
      |
      v
    Nginx :80
      |
      v
Backend :3000
      |
      v
PostgreSQL :5432
```
Better:
```
Public:
80 ✅

Internal:
3000 ✅ only Docker network
5432 ✅ only Docker network
```
**Container should be non-root.**

## 7. Compose Security

### 1. Backend

```YAML
security_opt:
  - no-new-privileges:true
```
This helps prevent the process inside the container from gaining new privileges.

### 2. Capabilities

We can use:
```YAML
cap_drop:
  - ALL
```
For some services.
But:
> Don't adjust for Nginx and all containers blindly.
Because some images need to capabilities for startup or binding a port.
For a stateless backend, it usually a good candidate for hardening, but you should test the healthcheck after the change.

### 3. read-only filesystem

For example:
```YAML
read_only: true
```
This can reduce the level of container filesystem changes.

But the application might need to write for:
```
/tmp
runtime files
cache
```
So if you need to test for backend:
```YAML
read_only: true
tmpfs:
  - /tmp
```
Then:
```Bash
sudo docker compose up -d --force-recreate backend
```
And:
```Bash
sudo docker compose ps
```
If the application crashes, rollback the configuration and find the cause.

### 4. Docker socket

If you see:
```YAML
volumes:
  - /var/run/docker.sock:/var/run/docker.sock
```
This is dangerous.

In general, mounting a Docker socket can give very powerful access to the Docker daemon.

For Minishop applications don't need:
```
❌ Docker socket
```

Know:
```YAML
privileged: true
```
Greatly increases the container's access level.

For cAdvisor in the lab we may need more access to the host, but:
> Don't this for Backend or PostgreSQL.

## 8. Secrets Management

### 1. `.env`

Check:
```Bash
ls -la /opt/minishop/.env
```
should be like:
```
-rw-------
```
For example:
```Bash
sudo chmod 600 /opt/minishop/.env
```

### 2. Ownership

Check:
```Bash
sudo stat /opt/minishop/.env
```
And decide what users can read it.

### 3. Git

```Bash
git check-ignore -v .env
```
Should show ignored `.env`.

Then:
```Bash
git status
```
Make sure secret doesn't log into Git.

### 4. Search for secrets

In the repo:
```Bash
grep -RniE 'password=|api[_-]?key|secret|token' . \
  --exclude-dir=.git \
  --exclude='package-lock.json'
```
This is only a quick check. it's not a complete secret scanning.

## 9. Network Exposure

### Don't publish all ports

Take it:
```Bash
sudo ss -lntup
```
| Port | Service | Needs external access? |
| :--: | :-----: | :---------: |
| 22 | SSH | Yes, restricted |
| 80 | Nginx | Yes |
| 3000 | Backend | No |
| 5432 | PostgreSQL | No |
| 3001 | Grafana | Restricted |
| 8080 | cAdvisor | No |
| 9090 | Prometheus | No |
| 9100 | Node Exporter | No |

## 10. Image Security

### Pin Image

We had:
```YAML
image: grafana/grafana:latest
```
It is acceptable for lab.
For production is better:
```
version tag
```
And even:
```
image digest
```
like:
```Bash
docker inspect container_name --format='{{.Image}}'
docker pull prom/node-exporter@sha256:da83fae85603c4e47e6c68369a7d746e2dda683dc35ea2e234b4f171e0d92798
```
Because `latest` is mutable.

---

At least get image inventory:
```Bash
sudo docker images
```
And:
```Bash
sudo docker compose images
```
Then look at:
```
Which images are official?
Which are third-party?
Which use latest?
Which need pinning?
```
## 11. Logging and Security

- Allow expected characters only and/or encode the input based on the target to prevent log injection attacks. The preferred approach would be that the logging solution performs input escaping instead of dropping data: otherwise the logging solution might discard data which would be needed for a later analysis.
- Do not log sensitive information. For example, do not log password, session ID, credit cards, or social security numbers.
- Protect log integrity. An attacker may attempt to tamper with the logs. Therefore, the permission of log files and log changes audit should be considered.
- Forward logs from distributed systems to a central, secure logging service. This will ensure log data cannot be lost if one node is compromised. This also allows for centralized or even automated monitoring.

## 12. Monitoring and Security

We added in the lab:
```
3001 Grafana
8080 cAdvisor
9090 Prometheus
9100 Node Exporter
```
Don't public these without reason.

In the production:
```
Node Exporter → internal
cAdvisor      → internal
Prometheus    → internal
Grafana       → restricted access
```

## 13. Incident Response

### SSH Brute Force

#### Incident

Monitoring shows to have a lot of login failure on the SSH.

#### Symptoms

```
Failed password
Failed password
Failed password
...
```

#### Investigation

```Bash
sudo journalctl -u ssh --since "30 min ago"
```
Then:
```Bash
sudo ss -lntup | grep ':22'
```
And:
```Bash
sudo ufw status numbered
```
Check:
```
Who is trying?
From which IP?
Is password authentication enabled?
Is root login enabled?
```

#### Root Cause

Like:
```
SSH exposed broadly
+
Password authentication enabled
```

#### Recovery

```
Disable root login
Disable password authentication after key verification
Restrict SSH source network
Review affected accounts
```

#### Prevention

```
SSH keys
Firewall
Restricted source IP
Fail2ban / equivalent later
Monitoring
```

## 14. Security Checklist

```
✅ Root login disabled
✅ SSH keys
✅ Password authentication disabled after verification
✅ Limited authentication attempts
✅ Only required users
✅ SSH exposed only where needed
```

After hardening again:
```Bash
sudo ss -tulnp
```
And:
```Bash
sudo docker compose ps
```
And:
```Bash
sudo docker stats --no-stream
```
And:
```Bash
sudo docker inspect minishop-backend \
  --format='User={{.Config.User}}'
```
And:
```Bash
sudo docker inspect minishop-backend \
  --format='{{json .HostConfig.SecurityOpt}}'
```
