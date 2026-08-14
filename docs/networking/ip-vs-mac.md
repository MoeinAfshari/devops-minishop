# IP vs MAC

|  Feature  |  MAC Address  |  IP Address  |
| :-------: | :-----------: | :----------: |
| OSI Layer | Layer 2 (Data Link) | Layer 3 (Network) |
| Length | 48-bit | 32-bit (IPv4) / 128-bit (IPv6) |
| Purpose | Identifies a network interface on a local network| Identifies a device across networks |
| Changes | Usually permanent (can be chagned/spoofed) | Can be static or dynamic (DHCP) |
| Example | `3a:4d:06:4f:37:58` | `172.100.0.1` |
| Format | Hexadecimal | Decimal (IPv4) |
| Scope | Local network (LAN) | Local network and across defferent networks

- Why do we need both IP and MAC? MAC addresses are used for communication within the local network, while IP addresses allow packets to be routed between different networks to reach their final destination.

- If two computers are in the same LAN, do they need a router to communicate? No. Devices on the same local network communicate using MAC addresses after resolving them through ARP. A router only needed to communicate with devices on different networks.
