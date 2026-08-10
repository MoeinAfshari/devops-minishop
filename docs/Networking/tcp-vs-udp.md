# TCP vs UDP

## TCP vs UDP Comparision

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
| Used by HTTP, HTTPS, FTP, SMTP | Used by DNS, DHCP, VoIP, NTP, Streaming |

- Sequence Number: Each TCP segment sent by the sender includes a portion of data. TCP assigns a unique sequence number to each byte in the data stream. This number is essential for tracking and managing data during transmission. In the TCP header, the Sequence Number field is 32 bits long.
- Low Latency: User Datagram Protocol (UDP) is a communication protocol primarily used to establish low-latency and loss-tolerating connections.
