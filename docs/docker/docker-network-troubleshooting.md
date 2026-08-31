# Docker Network Troubleshooting

## Flow

```Bash
Container Status
      ↓
Network Membership
      ↓
DNS Resolution
      ↓
TCP Port
      ↓
Application
      ↓
    Logs
```

## Workflow

1. `docker ps` -> Are containers running?
2. `docker network inspect` -> Are containers in the network?
3. `docker exec -it first_container sh` -> Go to inside of container.
4. `getent hosts second_container` -> Does it find second container?
5. `nc -zv second_container port` -> Is port of TCP connectivity open?
6. `wget -qO- http://second_container` | `curl http://second_container` -> Is HTTP/Application ok?
7. `exit` -> Exit from first container.
8. `docker logs second_container` -> Check logs of second container.
9. `docker logs first_container` -> Check logs of first container.
