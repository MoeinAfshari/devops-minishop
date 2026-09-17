#!/bin/bash

set -e

IMAGE="$1"
CONTAINER_NAME="minishop-backend"

if [ -z "$IMAGE" ]; then
  echo "Usage: $0 <image>"
  exit 1
fi

echo "Pulling image: $IMAGE"
docker pull "$IMAGE"

echo "Stoping old container..."
docker stop "$CONTAINER_NAME" 2>/dev/null || true

echo "Removing old container..."
docker rm "$CONTAINER_NAME" 2>/dev/null || true

echo "Starting new container..."
docker run -d \
  --name "$CONTAINER_NAME" \
  -p 3000:3000 \
  "$IMAGE"

echo "Checking container..."
docker ps --filter "name=$CONTAINER_NAME"

echo "Checking health..."
sleep 5

curl -f http://localhost:3000/health

echo ""
echo "Deployment successful!"

