# Container Communication

1. Container A -> Container B: Containers can communicate with using IP address (usually default bridge) or with using Name-based communication (Custom bridge).
2. Name-based communication: Allows containers to communicate using names instead of IPs. In Docker, Custom Bridge Network gives Name-based discovery to containers.
3. IP-based communication: Every container gets an IP address when adds to a network. Containers communicate with together with using these IPs.
4. Port inside container: A port inside a Docker container is an isolated network endpoint where an internal application listens for traffic.
5. Port publishing: Because containers run in a private network, an internal port (Exposing) cannot be accessed directly from your main computer or the outside world unless you map it to a host port using port forwarding (-p).
