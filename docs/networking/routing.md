# Default Gateway & Routing

## Default Gateway

The deafult gateway is the node that forwards the packet from the source to other networks when there is no routing information about the destination i.e. host (or router) doesn't know where the destination is present.

### Default Routing

Default routing sends packets to predefinder gateway when no specific route is available. It is commonly used in networks with a single exit point. (0.0.0.0/0)

### Find default gateway

`ip route | grep default`

## Routing

Network routing is the process of selecting the best path for data to travel across one or more networks.

### Working Principle of Routing

1. Communication Start
2. Data Packets
3. Routing Table
4. Hopping
5. Destination

**Note:** The Internet is a packet-switched network.

## Router

A router is a networking device that controls how data moves between defferent networks by checking destination IP address and choosing the best path.

## Static Routing 

Static routing is a non-adaptive routing method where routes are configured manually by the network administrator. It provides complete control over routing decisions but is best suited for small networks.

## Dynamic Routing

Dynamic routing is an automatic and adaptive routing method where routers choose paths using algorithms. It is widely used in modern networks due to its flexibility.

## Routing Table

A routing table is a set of rules, often viewed in table format, that is used to determine where data packets traveling over an Internet Protocol (IP) network will be directed. All IP-enabled devices, including routers and switches, use routing tables.

## Routing Table Commands

- `ip route` (the simplest) -> `default via 192.168.100.1 dev wlp4s0 proto dhcp src 192.168.100.7 metric 600` -> `deafult` means default gateway, `via 192.168.100.1` means the gateway address, `dev wlp4s0` means the ethernet card.
- `route -n` 
- Command Comparision
| Task	| Modern ip Command (Recommended) | Legacy route Command (Deprecated) |
| :---: | :-----------------------------: | :-------------------------------: |
| View Table | ip route | route |
| View (Numeric) | ip route (default) | route -n |
| Add Default GW | sudo ip route add default via 192.168.1.1 | sudo route add default gw 192.168.1.1|
| Add Static Route | sudo ip route add 10.0.0.0/24 via 192.168.1.1 | sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw 192.168.1.1 |
| Delete Route | sudo ip route del 10.0.0.0/24 | sudo route del -net 10.0.0.0 netmask 255.0.0.0|
Reject Route	sudo ip route add blackhole 192.168.1.51	sudo route add -host 192.168.1.51 reject
