# Transport Layer (OSI Layer 4)

The Transport Layer ensures the end-to-end delivery of entire messages.

- Data Unit: Data is broken down into Segments.
- Service Point Addressing: Uses Port Numbers (e.g. Port 80 for web traffic) to ensure data is delivered to the specific process or application intended, not just the device.
- Segmentation & Reassembly: Splits large messages into smaller segements for transmission and reassembles them in the correct order at the destination.
- Protocols: TCP (reliable), UDP (fast)
- Connection-Oriented (TCP): Requires a "handshake" to establish a connection; ensure reliability via error checking and acknowledgement.
- Connectionless (UDP): Sends data immediately without a format connection; faster but offers no guarantee of delivery.

#### TCP vs UDP

| TCP (Transmission Control Protocol) | UDP (User Datagram Protocol) |
| :---------------------------------: | :--------------------------: |
| Connection-oriented; uses a three-way handshake | Connectionless; no handshake |
| Guarantees reliable data delivery | Does not guarantee delivery |
| Uses acknowledgements (ACKs) | No acknowledgements |
| Supports retransmission of lost packets | No retransmission support |
| Ensures packets are delivered in order | Does not ensure ordering |
| Provides flow control and congestion control | No flow or congestion control |
| Slower due to higher overhead | Faster with minimal overhead | 
| Variable header size (20–60 bytes) | Fixed header size (8 bytes) |
| Treats data as a continuous byte stream | Treats data as independent messages |
| Does not support broadcasting or multicasting | Supports broadcasting and multicasting |
| Used by HTTP, HTTPS, FTP, SMTP | Used by DNS, DHCP, VoIP, Streaming |


#### Port vs Socket

Both Socket and Port are the terms used in Transport Layer.

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

#### Source Port & Destination Port

| Sr. No. | Basis of Comparison | Source Port | Destination Port |
| :-----: | :-----------------: | :---------: | :--------------: |
| 1. | Definition | A source port is the TCP or UDP number used by a program to send data to another program on one end | A destination port is the TCP or UDP number used by a program on one side of communication to receive data from another program on the other end. |
| 2. | Client-Side | On the client-side, the source port specifies the program to which the TCP element belongs, and the client gives this port number dynamically. This is basically the process of assigning a port number. | On the client-side, the destination port defines the service's position on the server which permits the server to complete the client's request. |
| 3. | Server Side      It identifies the application that is generated the TCP segment. | It identifies the application to which the TCP segment is forwarded. |
| 4. | Sender and Receiver | The sender uses port numbers to inform the receiver which application to use to obtain the data. | The receiver uses port numbers to determine which application it should deliver data to. |
| 5. | Nature | Source ports are basically the user sessions. | Destination ports are the server applications. |
| 6. | Port numbers | It is the next available number for allocation to the user machine. | Destination ports may be well-known ports that lie in the range of 0-1023 like port 80 used to specify HTTP Web Services, port 21 used to specify FTP services, port 23 used to specify the Telnet services, etc. |

#### Client & Server

The Client-Server Model is a network architecture in which clients send requests for resouorces or services, and servers process these requests, returning the required responses.

- Client: A device or program that requests data or services (e.g. web browser).
- Server: A system that stores resources, managed data, and responds to client requests.

#### Connection

**Client-Server Communication Flow**

1. Server creates a socket
2. Binds socket to IP address and port
3. Listen for incoming connections
4. Client creates a socket and sends connection request
5. Server accepts the connection
6. Server sends message to client
7. Client receives and displays message

