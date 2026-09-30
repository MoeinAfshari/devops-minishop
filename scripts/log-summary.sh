#!/usr/bin/env bash

set -euo pipefail

echo "=== MiniShop Log Summary ==="

echo
echo "=== Backend Errors ==="
docker compose logs --no-color --tail=100 backend | grep -Ei 'error|fatal|panic' || true

echo
echo "=== Nginx Errors ==="
docker compose logs --no-color --tail=100 nginx | grep -Ei 'error|502|503|504' || true

echo
echo "=== PostgreSQL Errors ==="
docker compose logs --no-color --tail=100 postgres | grep -Ei 'error|fatal|panic' || true
