# ARP (Address Resolution Protocol)

1. What is ARP? ARP maps an IPv4 address to the corresponding MAC address on a local network so frames can be delivered to the correct device.
2. What's ARP Request? 
- A broadcast message sent to all devices in the local network. 
- Asks: "Who has this IP address?"
- Used when the MAC address for a given IP is not present in the ARP cache.
3. What's ARP Reply? 
- A unicast message sent by the device that owns the requested IP address. 
- Contains the corresponding MAC address. 
- Allows the sender to update its ARP cache and proceed with data transmission.
4. What's ARP Cache? 
- A temporary storage table maintained by a device.
- Stores recently resolved IP-to-MAC address mappings.
- Reduces network overhead by avoiding repeated ARP requests.
5. Why do we need ARP? Because Ethernet communication requires MAC address, while applications ususally know only IP addresses. ARP resolves an IP address to its corresponding MAC address so data can be delivered within the local network.

To display the current entries in the `arp` table:
- `ip neigh` (it's more modern)
- `arp -a`

## Diagram example

```bash
PC A
IP: 192.168.1.10
↓
PC A wants to send data to 192.168.1.20
↓
Checks ARP Cache
↓
Doesn't find MAC
↓
Broadcast
"who has 192.168.1.20"?
↓
PC B resolves: "I have it."
MAC = 00:11:22:33:44:55
↓
ARP Cache updates
↓
Sends packets
```

## Analyse ip neigh

`192.168.100.1 dev wlp4s0 lladdr 00:50:56:c0:00:08 REACHABLE `

- `192.168.100.1` -> device ip
- `dev wlp4s0` -> through this interface
- `lladdr` means Link Layer Address
- `00:50:56:c0:00:08` -> MAC Address
- `REACHABLE` -> Entry Status -> REACHABLE = every thing is ok
