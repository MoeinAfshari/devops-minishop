## DNS Record Types

| DNS Record Type | Purpose | Example | When we use it? |
| :-------------: | :-----: | :-----: | :-------------: |
| A (address) | An A record shows the IP address for a specific hostname or domain. | map `example.com` to `93.184.216.34` | The main use of A record is for IP address lookup. Another used of A record is the domain name system-based blackhole list (DNSBL). Here, the A record is used to block mail from known spam sources. |
| AAAA (quad A) | This DNS record type is different in the sense that it points to IPv6 addresses. | 3001:0db7:3c5d:0024:0000:0000:1a2f:3c1b | Quad A records are used to resolve a domain name to the newer IPv6 protocol address.
| CNAME (Canonical Name) | CNAME is a DNS record that points a domain name (an alias) to another domain. | ng.example.com -> example.com (CNAME) -> actual IP address (A) | A practical example for the use of CNAME records is running multiple subdomains for different purposes on the same server. |
| NS (Name Server) | A nameserver (NS) record specifies the authoritative DNS server for a domain. | `ns1.examplehostingprovider.com` & `ns2.examplehostingprovider.com` | If you've purchased a web hosting service or set up a simple website, you probably received an email with nameserver details. Those nameservers, in simple terms, connect your domain name to the actual server your site is hosted on. The nameserver contains other DNS records for the domain like an A record and MX record. |
| MX (Mail Exchange) | An MX record makes it possible to direct emails to a mail server. | map emails to `mx.zoho.com` | With an MX record, it's possible to hand off emails to a dedicated email server. |
| TXT (text) | This record type lets the owner of a domain store text values in the DNS. | `example-site-verification=85Kh11mr3Lj9vPT4CRW6187op5NdRiYq7TuWzBRYQh` | Several services use this record to verify ownership of a domain. |
| PTR (pointer) | A PTR record provides a domain name for reverse lookup. | `192.0.2.255` would be stored under `255.2.0.192.in-addr.arpa` | PTR records used in reverse DNS lookups like Anti-spam, Troubleshooting email delivery issues, Logging, ... |
| SOA (Start of Authority) | It's an important DNS record type that stores admin information about domain. | The admin information | This uses for email adress of the admin and when the domain was last updated. |
| SRV (Service) | Using this DNS record type, it's possible to store the IP address and port for specific services. | - | - |

