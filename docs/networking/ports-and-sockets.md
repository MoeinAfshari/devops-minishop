# Ports and Sockets

- Port: Port is a logical number to identifies a service in a host.
- Socket: Socket is a combination of IP Address ,Port and Protocol to identifies a connection Endpoint.

| Parameters | Socket | Port |
| :--------: | :----: | :--: |
| Definition | An endpoint for sending or receiving data across a network. | A numerical identifier for specific services or processes on a device. |
| Function | Facilitates communication between two devices. | Identifies different applications/services on a device. |
| Components | Consists of an IP address and a port number. | Consists solely of a number (0-65535). |
| Type | Exists in pairs (one on the client, one on the server). | Single numeric value. |
| Scope | Used for establishing and maintaining connections. | Used for routing data to the correct application. |
| Communication | Supports bidirectional data transmission. | Does not transmit data; helps direct data to sockets. |
| Protocols | Utilized in both TCP and UDP protocols | Defined within networking protocols (TCP, UDP, etc.). |
| State | Can be in different states (e.g., listening, established). | Does not have states. |
| Resource Usage | Consumes system resources (e.g., file descriptors). | Minimal resource usage, mainly memory. |
| Creation | Created by the operating system when a network application starts. | Predefined or dynamically assigned during a session. |
| Uniqueness | Unique combination of IP address and port number. | Only needs to be unique per IP address. |
| Lifespan | Exists for the duration of a network session. | Can be persistent (well-known) or ephemeral (dynamic). |
| Addressing | Provides a complete network address for communication. | Part of the address used by sockets. |

**Notes:**
- `tcp LISTEN 0 511 0.0.0.0:80` means a HTTP service is listening on the port 80 & all local IPv4 interfaces.
- `tcp LISTEN 0 200 127.0.0.1:5432` means that is listening only on the localhost (127.0.0.1).
- All TCP sockets are connected if their state is LISTEN or ESTABLISHED but UDP sockets can be open if their state even is UNCONN.
