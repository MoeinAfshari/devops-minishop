# Docker DNS

1. Docker Internal DNS: Docker has an internal DNS that creates name-based connections like connection between containers on a user-defined bridge network.
2. Service Name Resolution: Service name resolution creates connection between containers on a same user-defined bridge network with container names by using Docker internal DNS.
3. Container name: A container name is a human-readable identifier used in software like Docker (--name flag) to uniquely label and refrence a specific software container or layout element instead of using a random ID or unnamed refrence.
4. Container IP: By default, the container gets an IP address for every Docker network it attaches to. A container receives an IP address out of the IP subnet of the network.
5. localhost: `localhost` mentions to the inside container itself.

