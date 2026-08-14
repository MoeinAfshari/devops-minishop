# IPv4

## Definiton

An IPv4 address is a 32-bit number, usually written in "Dotted Decimal" format. It consists of four numbers (octets) ranging from 0 to 255, seperated by dots.

## Network ID & Host ID

- Network ID: Identifies the "Street"
- Host ID: Identifies the "Home Number"
- Note: The split (network & host) depends on the Class or Subnet Mask.

## IPv4 vs IPv6

|  Feature      |   IPv4          |   IPv6            |
| :-----------: | :-------------: | :---------------: |
| Size          | 32-bit          | 128-bit           |
| Format        | Numeric         | Alphanumeric      |
| Total Address | ~4.3 Bilion     | ~340 Undercilion  |
| Example       | 192.168.1.1     | 2001:0db8:::::7334|
| Security      | IPSec Optional  | IPSec Built-in    |

## Types of IP Address

1. Public IP Address: A public IP address is an Internet Protocol address, encrypted by various servers/devices. That's when you connect these devices with your internet connection. my router has a public IP on the Internet.
2. Private IP Address: Everything that connects to your Internet network has a private IP address. Routers generate private IP addresses that are unique identifiers for each device that seperate the network. my cell phone has a private IP in the LAN.
3. Static IP Address: Thhe Static IP address doesn't change but can be changed as part of normal network management. The router can has a static IP address.
4. Dynamic IP Address: A dynamic IP address changes from time to time and is not always the same. Most ISPs will not provide a static IP address to customers. Dynamic IP addresses usually are made with DHCP automatically.

## Types of Website IP Address

- Dedicated IP Address: A dedicated IP address is one that is unique for each website. It provides increased speed when the traffic load is high and brings in increased security.
- Shared IP Address: A shared IP address is one that is not unique. It is shared between multiple domains.

## Classes

| Classes | Range | Network | Host Bits | Use | Example | Exceptions |
| :-----: | :---: | :-----: | :-------: | :-: | :-----: | :--------: |
| Class A | 1.0.0.0 - 126.255.255.255 | 8 | 24 | Large Networks | Government organizations | 127 is reserved for loopback |
| Class B | 128.0.0.0 - 191.0.0.0 | 16 | 16 | Medium-sized networks | Universities |
| Class C | 192.0.0.0 - 223.0.0.0 | 24 | 8 | Small networks | Home & small businesses |
| Class D | 224.0.0.0 - 239.255.255.255 | - | - | Multicast communication | Video streaming |
| Class E | 240.0.0.0 - 255.255.255.255 | - | - | Experimental & research | No used for public networking |

## IP Address Classification Based on Operational Characteristics

- Broadcast addressing: The term 'Broadcast' means to transmit audio or video over a network. A broadcast packet is sent to all users of a local network at once. This service is available in IPv4. The IP address commonly used for broadcasting is 255.255.255.255 .
- Unicast addressing: This address identifies a unique node on the network. Unicast is nothing but one-to-one data transmission from one point in the network to another. It is available in IPv4 and IPv6.
- Multicast IP addresses: These IP addresses mainly help to establish one-to-many communcation. The class D addresses define the multicast group.
- Anycast addressing: When a data packet is allocated to an anycast address, it is delivered to the closet interface that has this anycast address.

## CIDR (Classes Inter Domain Routing)

### Definition

CIDR is a method of IP address allocation and routing that allows more efficient use of IP address.

### Why CIDR?

**Problem:** Organizations often need a number of hosts that don't match class sizes, leading to wastage.
**Solution:** CIDR allows flexible block allocation matching exact requirements.

### Rules of Formating CIDR Blocks

- All IPs must be contigous.
- Block size must be a power of 2 simplifes network division.
- First IP of block divisible by block size least significant bits of host ID should be 0.

**Example:** Check whether 100.1.2.32 to 100.1.2.47 is a valid IP address block or not?

- All the IP addresses are contiguous.
- Total number of IP addresses in the Block = 16 = 2^4.
- 1st IP address: 100.1.2.00100000 Since, Host Id will contains last 4 bits and all the least significant 4 bits are zero. Hence, first IP address is evenly divisible by the size of the block.

All three rules are followed by this Block. Hence, it is a valid IP address block.

### Practice 

How many hosts does each have?

- \8 -> 2^24 - 2
- \27 -> 2^5 - 2

**Note:** Two addresses usually aren't usable in the IPv4; First address (Network Address) like `192.168.1.0` and the last address (Broadcast Address) like 192.168.1.255 .
