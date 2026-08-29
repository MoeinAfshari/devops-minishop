#!/usr/bin/env bash

set -euo pipefail

BACKUP_DIR="./backups"
BACKUP_FILE="${BACKUP_DIR}/minishop-$(date +%Y%m%d-%H%M%S).sql"

mkdir -p "$BACKUP_DIR"

docker compose exec -T postgres \
  pg_dump \
  -U postgres \
  -d minishop \
  > "$BACKUP_FILE"

echo "Backup created: $BACKUP_FILE"
