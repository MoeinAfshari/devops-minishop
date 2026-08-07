# Network Troubleshooting

## ICMP

ICMP (Internet Control Message Protocol) is a network layer (layer 3) protocol used by hosts and routers to report errors and exchange diagnostics information.

## Ping

Ping (latency) is the time it takes for the smallest possible packet of data to travel from your device to a server and back. Ping uses ICMP Echo Request Echo Reply messages.

## Traceroute

Traceroute is a network diagnostic tool that shows the path packets take to reach a destination. Traceroute uses ICMP Time Exceeded messages on Linux.

## Tracepath

It operates similary to the traceroute command but doesn't require superuser privileges and offers a simpler set of options, making it user-friendly and accessible for basic network troubleshooting.

## dig

dig command stands fo Domain Information Groper. It retrieves information about DNS name servers.

## host

host command is used to find the IP address of a particular domain name or if you want to find out the domain name of a particular IP address the host command becomes handy.

## nslookup

Nslookup is a network administration tool for querying the Domain Name System (DNS) to obtain domain name or IP address mapping or any other specific DNS record.

## ss

The ss command (Socket Statistics) is an important Linux utility used to display detailed information about sockets.

