#!/bin/bash

set -euo pipefail

IMAGE="${1:-}"

CONTAINER_NAME="minishop-backend"
PORT="3000"

if [ -z "$IMAGE" ]; then
    echo "Usage: $0 <image>"
    exit 1
fi

echo "================================="
echo "MiniShop Backend Deployment"
echo "================================="

echo "Image:"
echo "$IMAGE"

echo
echo "Pulling image..."
docker pull "$IMAGE"

echo
echo "Stopping old container..."
docker stop "$CONTAINER_NAME" 2>/dev/null || true

echo
echo "Removing old container..."
docker rm "$CONTAINER_NAME" 2>/dev/null || true

echo
echo "Starting new container..."

docker run -d \
    --name "$CONTAINER_NAME" \
    --restart unless-stopped \
    -p "${PORT}:3000" \
    "$IMAGE"

echo
echo "Checking container..."
docker ps --filter "name=$CONTAINER_NAME"

echo
echo "Waiting for application..."

for i in $(seq 1 15); do

    if curl -fsS http://127.0.0.1:${PORT}/health >/dev/null; then
        echo "Application is healthy."
        echo "Deployment successful."
        exit 0
    fi

    echo "Health check failed. Retry $i/15..."
    sleep 2
done

echo
echo "Deployment failed."

echo "Container logs:"
docker logs --tail 100 "$CONTAINER_NAME" || true

exit 1
