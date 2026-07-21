# TCP vs UDP

## TCP vs UDP Comparision

|   Options      |   TCP (Transmission Control Protocol)            |   UDP (User Datagram Protocol)   |
| :------------: | :----------------------------------------------: | :------------------------------: |
| Realiability   | ⭡ Guarantees reliable data delivery              | ⭣ Doesn't guarantee delivery     |
| Speed          | ⭣ Slower due to higher overhead                  | ⭡ Faster with minimal overhead   |
| Connection     | ⭡ Connection-oriented; used a three-way handshake| ⭣ Connectionless; no handshake   |
| Ordering       | ⭡ Ensure packets are delivered in order          | ⭣ Doesn't ensure ordering        |
| Acknowledgment | ⭡ Uses Acknowledgment (ACKs)                     | ⭣ No Acknowledgments             |
| Use Cases      | Critical data requiring strict reliability       | Low latency and less reliability |

## Use Cases

- SSH uses TCP
- HTTP uses TCP
- HTTPS uses TCP
- DNS uses UDP
- DHCP (Dynamic Host Configuration Protocol) uses UDP
- NTP uses UDP

