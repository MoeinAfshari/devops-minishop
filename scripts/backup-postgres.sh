#!/usr/bin/env bash

set -euo pipefail

#PROJECT_DIR="$(pwd)"
PROJECT_DIR="/home/moein/Documents/devOps/devops_course/devops-minishop"
BACKUP_DIR="$PROJECT_DIR/backups"

TIMESTAMP="$(date '+%Y%m%d_%H%M%S')"
BACKUP_FILE="$BACKUP_DIR/minishop_${TIMESTAMP}.dump"

mkdir -p "$BACKUP_DIR"

cd "$PROJECT_DIR"

docker compose exec -T postgres \
  sh -c 'pg_dump -Fc -U "$POSTGRES_USER" "$POSTGRES_DB"' \
  > "$BACKUP_FILE"

sha256sum "$BACKUP_FILE" > "${BACKUP_FILE}.sha256"

# retention policy

find "$BACKUP_DIR" \
  -type f \
  -name 'minishop_*.dump' \
  -mtime +7 \
  -delete

echo "Backup created: $BACKUP_FILE"
echo "Checksum created: ${BACKUP_FILE}.sha256"
