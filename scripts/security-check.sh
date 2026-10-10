#!/usr/bin/env bash

set -euo pipefail

echo "=== MiniShop Security Check ==="

echo
echo "=== Listening Ports ===="
ss -tulnp

echo
echo "=== Docker Containers ==="
docker compose ps

echo
echo "=== Backend User ==="
docker inspect minishop-backend \
  --format='User={{.Config.User}}'

echo
echo "=== Backend Security Options ==="
docker inspect minishop-backend \
  --format='SecurityOpt={{json .HostConfig.SecurityOpt}}'

echo
echo "=== .env Permissions ==="
if [[ -f .env ]]; then
  stat -c '%A %U:%G %n' .env
else
  echo ".env not found"
fi

echo
echo "=== UFW Status ==="
sudo ufw status verbose
