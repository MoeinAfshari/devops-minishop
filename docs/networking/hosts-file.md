## DNS Resolution
 
DNS name resolution is the process of translating a domain name into its corresponding IP address so a device can locate and communicate with the correct server on the internet.

### Show DNS server or add a new nameserver

- `cat /etc/resolv.conf`

### Data about the current host

- `hostnamectl`
- `hostnamectl set-hostname moein2 --static` -> Change static hostname
- `hostnamectl set-hostname ubuntu --transient` -> Change(Set) transient hostname
- `hostnamectl set-hostname thisisme --pretty` -> Change(Set) pretty hostname
- `hostnamectl --pretty status` -> Verifying the change
- `hostnamectl set-hostname server3 -H root@172.102.2.24` -> Change hostname remotely

### getent

`getent` is a Linux command that retrieves entries from the system`s Name Service Switch (NSS) databases.

- `getent hosts google.com` -> It usually returns one IP address (The canonical hostname)
- `getent ahost google.com` -> It returns all usable socket addresses for the hostname, including adress family and socket type information
- `STREAM` -> TCP, `DGRAM` -> UDP, `RAW` -> Raw sockets
- Key differences
| Feature | getent hosts | getent ahosts |
| :-----: | :----------: | :-----------: |
| Returns | Hostname and IP | All resolved socket addresses |
| IPv4/IPv6 | May return one or more addresses | Returns all usable IPv4/IPv6 addresses |
| Socket type | No | Yes (STREAM, DGRAM, RAW) |
| Based on | gethostbyname()-style lookup | getaddrinfo()-style lookup |
| Common use | Simple hostname lookup | Debugging application address resolution |

- **Note:** hosts & ahosts are same for the localhosts

### dig

dig command stands for Domain Information Groper. It retrieves information about DNS name servers. Network administrators use it to verify and troubleshoot DNS problems and perform DNS lookups.

- `sudo apt install dnsutils` -> Install dig
- `dig google.com` -> To query domain "A" record
- `dig google.com +short` -> Just returns IPs
- `dig google.com ANY` -> To query all DNS record types
- `dig google.com +trace` -> To trace DNS path
- `dig +noall +answer -x 8.8.8.8` -> Reverse DNS Lookup

### nslookup

Nslookup (stands for “Name Server Lookup”) is a useful command for getting information from the DNS server.

- `nslookup google.com` -> Find server IP addresses (can do the reverse DNS look-up too)
- `nslookup -type=any google.com` -> Get any type

### host

- `host google.com` -> Get just IPv4 & IPv6 IP address for a domain

## /etc/hosts

### Name Resolution Order

1. User Input: The user enters a domain name.
2. Local Cache Check: The browser or OS checks its cache for a stored IP address.
3. DNS Resolver Query: If not found, the request is sent to a DNS resolver (usually ISP).
4. Root Server Query: The resolver queries a root server, which points to the correct TLD server.
5. TLD Server Response: The TLD server directs the resolver to the domain's authoritative server.
6. Authoritative Server Response: The authoritative server returns the actual IP address.
7. Final Response: The resolver sends the IP back to the user, and the browser connects to the server.

### Differece between DNS & /etc/hosts

The `/etc/hosts` file is a local text file that maps hostnames (or FQDNs) to IP addresses. It is checked before DNS on most Linux systems (depending on the `nsswitch.conf` configuration).
Unlike DNS, which provides centralized and dynamic name resolution across networks, `/etc/hosts` is local to a single machine and must be updated manually. It is commonly used for testing, local development, or overriding DNS records.
- **Note:** In most Linux distributions, the system decides where to resolve a domain name first based on the settings in the Name Service Switch (NSS) specified in the `/etc/nsswitch.conf` file. -> `hosts: files dns` means to check local file (/etc/hosts) in the first and then dns server.
- `cat /etc/hosts`
- Difference between DNS & /etc/hosts:
| Feature | DNS | `/etc/hosts` |
| :-----: | :-: | :----------: |
| Location | DNS Server | Local file |
| Scope | Entire network / Internet | Single machine |
| Management | Centralized | Manual |
| Scalability | High | Low |
| Updates | Dynamic | Manual |
| Typical Use | Production name resolution | Testing, development, overriding |
