# Docker Networking

1. What is Docker Networking? Docker networking enables containers to communicate with each other, the Docker host and external systems. Each container runs in its own isolated network environment with a unique IP address and network interface. Containers on the same network can communicate directly without exposing ports to the host, allowing you to build secure, interconnected multi-container applications.
2. Docker Network Drivers:
- bridge (default): Creates a private network where containers communicate internally and require port mapping for external access.
- host: Shares the host network directly, offering better performance but no isolation.
- none: Provides full isolation  with no network access.
- overlay: Enables communication across multiple hosts in distributed setups.
- macvlan: Assigns a MAC address to make containers appear as physical devices.
- User-defined bridge: Allows containers to communicate using names instead of IPs.
3. Container IP: By default, the container gets an IP address for every Docker network it attaches to. A container receives an IP address out of the IP subnet of the network.
4. Container name: A container name is a human-readable identifier used in software like Docker (--name flag) to uniquely label and refrence a specific software container or layout element instead of using a random ID or unnamed refrence.
5. Network Namespace: Container Network Namespaces provide network isolation by giving each container its own interface, IP, and routing.
