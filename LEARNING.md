# Day 1

## What I learned

- Reay Ubuntu
- Install Git
- Add first commit
- Initial commands of linux
- pwd
- ls
- cd
- mkdir
- touch
- cp
- mv
- rm
- cat
- history
- clear

## Challenges

1. Created it:
```
Practice/

├── Linux/
├── Bash/
├── Git/
└── Docker/
```
2. Installed Ubuntu, Git, Vs Code, Docker Engine or Docker Desktop, Node.js, PostgreSQL, Redis
3. Created repository (devops-minishop in github)
4. Created Issues


## Notes 

1. The console behind curtain: Go from GUI to CLI mode: Ctrl+Alt+F6 , Back to Graphical mode: Ctrl+Alt+F1 | Ctrl+Alt+F7
2. Exit terminal with `exit` | Ctrl+D
3. Change directory to home of a user: `cd ~user_name`
4. Create an issue: `gh issue create --title "your title"` -> Delete an issue: `gh issue delete 1` (number of issue)


# Day 2

## What I learned

- Manage files & directories
- Manage users & groups
- Manage permissions
- whoami
- id
- groups
- sudo
- useradd
- adduser
- passwd
- groupadd
- usermod
- chmod
- chown
- chgrp
- getent
- userdel
- groupdel

## Challenges

1. What's difference between chmod 777 and chmod 755?
```
777 = rwx rwx rwx
755 = rwx r-x r-x
7 = 4 + 2 + 1
Read = 4, Write = 2, Execute = 1
```
2. Why doesn't recommend "chmod 777" in a production? `Principle of Last Privilege`
3. What's difference between Owner & Group? `Owner is current owner of a file or directory that is one user but Group is current group of file or directory that includes some users in the group and they have group access permissions.`

## Notes

1. In the `ls -l` the first number is file's number of hard links like 1.
2. ASCII text is on of the simplest text encoding.
3. more program could only page forward, the less program allows paging both forward and backward
4. you can double-click a filename to copy it and middle-click to paste it into commands
5. Reset terminal: `reset`
6. copy only files that do not exist in the destination directory or are newer than the versions in the destination directory: `cp -u *.html destination`
7. Wildcards: *, ?, [characters], [!characters], [[:class:]] -> [:alnum:], [:alpha:], [:digit:], [:lower:], [:upper:]
8. When source of a symlink deleted, the symlink __broken__!
9. Hard links cannot span physical devices & they cannot reference directories, only files


# Day 3

## What I learned

- Define Processes
- Manage Services
- Installing & deleting Packages
- Read Logs
- Difference of Process and Service
- ps
- pgrep
- pidof
- systemctl
- apt
- journalctl
- dmesg

## Challenges

1. What's the process? `In Linux, a process is any active(running) instance of a program.`
2. What's the service? `A Linux service is a program that runs in the background and provides essential functionality to the system or other applcations.`
3. What's the difference between process and service? `A service is a special kind of process.`

## Notes

1. Every Process has an id (PID).
2. In computing, a parent process is a process that has created one or more child processes.
3. pgrep looks through the currently running processes and lists the process IDs which match the selection criteria to stdout. -> `pgrep -u root nginx`, `pgrep -c nginx` (count)
4. Pidof finds the process id's (pids) of the named programs: `pidof nginx`
5. killall kills all dependencies too: `kill -9 1234` (kill) -> `killall -9 firefox` (killall firefox & its dependencies) | `killall -u moein nginx`
6. pkill works with regex too: `exec -a process_1 sleep 60000 &` -> `pkill -f pro` (pkill is really dangerous)


# Day 4

## Waht I learned

- Manage Packages
- Define APT Repositories
- Read System Logs
- Check RAM, CPU & Disk Status

## Challenges

1. What does journalctl do? `journalctl manages logs and it shows them to valid users.`
2. What's the difference between dmesg & journalctl? `Both journalctl and dmesg can provide logs produced by the kernel. This will usually include the various device probe messages during the boot sequence, as well as any further messages outputted by the kernel during the running of the system.`

## Notes

1. If a server's RAM is full, what are the first commands you run? `free -> top -> ps -> Check the reason -> kill PID -> If doesn't close -> kill -9 PID`
2. If a server's RAM is full, what are the first commands you run? `free -> top -> ps -> Check the reason -> kill PID -> If doesn't close -> kill -9 PID`


# Day 5

## What I learned

- Define Variables
- Get Input from User
- Write If Conditions
- Write For & While Loops
- Create Functions
- Define Exit code
- Write an Interactive Bash Script

## Challenges

1. What's the difference between "$USER" and USER? `$USER expands the value of the USER environment variable, while USER without $ is treated as plain string (unless used in a different shell context)`.
2. What's the difference between read and echo? `read gets an input from user but echo shows an output to user`.
3. Why do use from function in bash? `We usually use from functions to avoid repetitive tasks and adhere to the DRY (Don't Repeat Yourself) principle. functions also improve code readability and maintainablility`.
4. What's the difference between for and while? `for usually uses for a fixed number of iterations but while usually checks a condition and repeat some tasks as long as the condition is met`.
5. What's Exit Code and why is 0 value important? `Every command has a return value in bash as exit code and if the commad was correct, its exit code is 0`.
6. What are the five basic commands to fix a slow server? `top` -> `free -h` -> `df -h` -> `ps aux --sort=-%mem | head` | `ps aux --sort=-%cpu | head` -> `journalctl -xe` | `dmesg`

## Notes

1. If you wanna print only the files: `ls -p | grep -v /`.
2. Variable Scopes: If you even define a variable in a function, it's global; Write that as local: `local variable="variable_value"` in the function.
3. A good DevOps: Observe -> Analyze -> Act -> Hope :)


# Day 6

## What I learned

- Use Case
- Understand commandline Arguments
- Use Exit Code
- Write a professional bash script

## Challenges

1. What's the difference between $* and "$@"? `"$*" expands all positional parameters into a single string, while "$@" expands them as seperate arguments, preserving each argument individually`.
2. What's the difference between exit 0 and return 0? `return is uded to exit a function and return control to the caller, while exit terminates the entire script or shell process with the specific exit status`.
3. Why is case better than if for menus? `case is better for menus because users choose from a fixed set of options. if statements are more suitable for evaluation logical or complex conditions`.
4. What does $0 return? `$0 returns the script file name or your shell name in the commandline and echo $0 prints it`.
5. What does it mean if a script ends with exit 1? `It means exit from program and terminate it right now. The script exits with status code 1, which usually indicates an error. A non-zero exit status indicates an error or abnormal termination.` 

## Notes

1. Variables naming rules:
- It can includes numbers, letters, underscore
- Don't start with numbers
- Don't use reserve names: if, elif, else, then, while, do, done, for, until, case, esac, break, continue, function, _
2. Script Header: shebang, Script, Author, Description
3. When every function just does one task, it calls Single Responsibility Principle.
4. Use these functions help to adhere DRY Principle

# Day 7

## What I learned

- Review

## Challenges

1. What's the difference between a process and a service? `A process is a running instance of a program. A service is a long-running process that usually runs in the background and is managed by a service manager such as systemd.`
2. What's the difference between a shell and a terminal? `A terminal is an application that provides access to a shell (like Gnome Terminal, Konsole, xterm, Windows Terminal, ...). A shell is a command-line interpreter that executes commands (like bash, zsh, sh, fish, ...).`
3. Why is Git important for DevOps engineers? `Version Control System (VCS) is really important in any software deployment and even DevOps, because with using it, we can manage the tasks from plan to release. Git is the most popular version control system.`
4. Why should scripts return proper exit codes?
`Exit codes allow other scripts and automation tools to determine whether a command successed or failed.`
5. What makes a Bash script maintainable? `A maintainable Bash script uses meaningful variable names, small functions, proper comments, consistent formatting, and follows the DRY principle.`

## Notes

1. One of co-workers say: "I run the script but I get permission denied!"
You are only allowed run 5 commands.
Write:
  1. What commands do you run?
  2. Why do you choose each one?
  3. At what point do you decide whether the problem is with Permissions, the file owner, or the file path?
  **Answer**:
  1. `whoami` | `echo "$USER"` -> I verify which user is executing the script because the current user may not have permission to execute or access the file.
  2. `id` -> I check the groups that the user is in them.
  3. `stat script.sh` -> I check the permissions of file, owner, group, ...
  4. `namei -l /path/to/script.sh` -> This command is really popular Linux tool for debug permissions. (If a directory doesn't have Execute Permission, I get permission denied)
  5. `journalctl -xe` -> After run script and get permission denied, check the last logs.
2. Explain the Linux boot process briefly. The firmware performs the POST, loads the bootloader(GRUB), which loads the Linux kernel. The kernel then starts the init system (usually systemd, PID 1), which initializes the system and starts servivces.
3. What happens when you run a command in Bash? The shell searches for the command in the directories listed in the `$PATH` environment variable. If the command is found, the shell executes it and returns an exit status. 
4. Why is Git essential in DevOps? A devops engineer almost needs a version control system for everything that wants to do like Collaboration, History, Rollback, CI/CD. Git is the most popular version control system.
5. How do you debug a bash script? You can check the syntax of a bash script with `bash -n script.sh` and debug it with `bash -x script.sh`.
6. What is the difference between ps and top? `ps` displays a snapshot of running processes, while `top` provides a real-time, iteractive view of system resources and processes.
7. What would you check first if a Linux server became slow? I check the `top` in the first for figure out what processes have the most resources usage and what part has emergency status, ram, cpu, disk or ...


# Day 8

## What I learned

- Manage Users & Groups
- Understand Ownership deeply
- Configure sudo
- Know `/etc/shadow` & `/etc/passwd` structures

## Challanges

1. What's the difference between `useradd` and `adduser`? `useradd` is a low-level command that creates users directly. `adduser` is a user-friendly interactive wrapper around `useradd` (on Debian-based systems) that automatically creates the home directory and prompts for additional user information.
2. Why shouldn't you log in as `root` for daily work? According to thhe Principle of Least Privilege, users should have only the permissions they need. Administrative tasks should be performed with `sudo` instead of logging in as the root user.
3. What's stored in `/etc/shadow`? Users password hashes and configurations  of passwords put in the `/etc/shadow` and root user just can look at it.
4. What's the difference between `su` and `sudo`? `su` switches to another user account and starts a new shell. `sudo` executes a single command with elevated privileges (or as another specified user). it execute a command as another user (by default root). like `sudo -u user_name command`.
5. Why do Linux systems use groups? Groups simplify permission management by assigning permissions to multiple users at once.
6. User `developer` can't edit `/opt/app/config.yaml`. What do you do with 5 commands? `whoami` | `echo $USER` -> `id` -> `stat /opt/app/config.yaml` -> `namei -l /opt/app/config.yaml` -> `journalctl -xe` | `journalctl -u app.service`

## Notes

1. Get default permissions for Files: `666 - umask_number` & for Directories: `777 - umask_number`

# Day 9

## What I learned

- Know Special Permissions (Advanced Permissions)
- Explain SUID, SGID, Sticky Bit
- Learn ACL
- Practice `getfacl` & `setfacl`

## Challenges

1. What's the difference between 777 and 755? These are numeric permissions (read:4, write:2, execute: 1); 777 means to give all permissions (read, write, execute) to every user (owner, group, other); 755 means the owner has all permissions, group & other users have read and execute permissions.
2. Why is 777 dangerous? 777 is dangerous because every user can read, modify, and execute the file, which can lead to accidental changes, privilege abuse, or security vulnerabilities. 
3. What's SUID? SUID is Set-User-ID. when suid adds to an excutable file, it runs with file's owner privileges instead of the user that executes it. the process runs with the file owner's privileges.
4. What's Sticky Bit? Sticky Bit is mainly used on directories. when it adds to a directory, only the file owner, the directory owner or the root user can delete or rename files inside the directory.
5. What's the difference between ACL and traditional permissions? Traditional Permissions allow access control only for the owner, group and others. ACL provides more fine-grained permissions, allowing specific users or groups to have different permissions without changing ownership or the main group.

## Notes

- Production Scenario: All users can edit `opt/app/database.conf/` and this is a security problem. How do you solve the problem without interrupting service?
- Answer:
1. `stat /opt/app/database.conf` -> I check the current owner, group, traditional permissions and advanced permissions.
2. `getfacl /opt/app/database.conf` -> I check the acl status of the file.
3. `namei -l /opt/app/database.conf` -> I check the path permissions of file too.
4. `chmod ---- /opt/app/database.conf` -> After verifying the required access for the application, I would adjust the permissions following the Principle of Least Privilege.
5. `setfacl -x u:username /opt/app/database.conf` -> I change file ACL permissions too if it was neccesary according to Principle of Least Privilege.
** Before changing permissions, I verify which user and group the application or service runs as (for example, using `ps`, `systemctl`, or the service configuration). Then I apply the minimum required permissions and test that the application still works correctly. **


# Day 10

## What I learned

- Explain the difference between Network, Internet, Host
- Know TCP/IP model deeply
- Know the difference between TCP & UDP
- Analyze IPV4
- Read CIDR
- Work with networking basic tools

## Challenges

1. What's the difference between a Network and the Internet? A network is a connection between two or more devices but the Internet is a global network of interconnected networks.
2. What's the difference between a Client and a Server? A client is a device or application that requests services or resources. A server is a device or application that provides services or resources to clients.
3. Explain the TCP/IP model. The TCP/IP model is a layered networking framework that explains how data is communicated between devices over a network using standardized protocols to ensure reliable and effecient transmission. It consists of four layers: Apllication, Transport, Internet, and Network Access.
4. What's the difference between TCP and UDP? TCP checks for errors and retransmits lost packets, which makes it reliable. UDP doesn't retransmit lost packets and focuses on low latency and speed.
5. Why does SSH use TCP instead of UDP? SSH requires reliable, ordered, and error-checked communication, which TCP provides.
6. What is a subnet mask? A subnet mask is 32-bit number used in IPv4 networking that helps divide an IP address into two components: the network prtion and the host portion.
7. Explain the difference between a Router and a Switch? A router connects different networks and forwards packets between them. A switch connects devices within the same local network (     LAN).
8. What is a default gateway? A default gateway is the network node, ususally a router, that devices use to access other networks when no other routes are specified.
1285 6. Which protocols usse TPC and which use UDP? HTTP, HTTPS, SSH, ... use TCP;DHCP, NTP, ... use UDP. DNS usually uses UDP, but it can also uses TCP in some cases.

## Notes

The development team has reported that the server has access to the Internet but can't connect to an internal server with address `10.10.10.20`.

What's the solution?

1. `ping 4.2.2.4` -> I ensure that the Interntet works.
2. `ping 10.10.10.20` -> I check the destination address.
3. `ip route` -> I need to find out there is any router for `10.10.10.0` network or not. for example if the output was:
```bash
default via 192.168.1.1
192.168.1.0/24 dev eth0
```
If there wasn't any route for `10.10.10.0/24`, you find the problem.
4. `ip addr` -> Where am I (inet 127.0.0.1/8 means subnet mask: 255.0.0.0, Network address: 127.0.0.0, Host address: 127.0.0.1, Broadcast: 127.255.255.255)? for example if my network is `192.168.1.50/24` for receive to `10.10.10.20`, I need to a router.
5. `traceroute 10.10.10.20` | `tracepath 10.10.10.20` show the packet go to where and where stops.


# Day 11

## What I learned

- Explain MAC Address
- What's the difference between IP and MAC?
- Know ARP
- Know Default Gateway deeply
- Learn Routing
- Work with important networking tools

## Challenges

1. What's the difference between an IP address and a MAC address? A MAC address is a physical address that identifies a network interface on a local network. It is usually permanent. An IP address is a logical address used to identify devices across different networks. It can be either static or dynamically assigned (DHCP).
2. Why do we need ARP? ARP is required for map an IP address to its corresponding MAC address for local area network communication. other devices or applications usually have access to IP address only.
3. What is a Default Gateway? A default gateway is the router that forwards packets to other networks when no specific route exists.
4. Explain what happens when your computer sends packet to another network? If the destination is on another network, the computer sends the packet to the default gateway (Finds default gateway MAC address with using ARP). The router checks its routing table and forwards the packet toward the destination network. 
5. What information does `ip neigh` show? It displays the current ARP (neighbor) table, including IP-to-MAC mappings and their states.

## Notes

1. A server has `192.168.10.20/24` IP and Default gateway has set `192.168.20.1` for that. The server couldn't connect to the Internt. What's the problem?
**Answer:**

- ```bash
    IP Address: 192.168.10.20/24
    Default Gateway: 192.168.20.1
    Problem: Connection to Internet
  ```
- This Gateway isn't in the subnet of the server.
- ```bash
    Sever Network address: 192.168.10.0/24
    Gateway:       192.168.20.1
    subnet mask: 255.255.255.0
    Block Size: 256
    The first host: 192.168.10.1
    The last host: 192.168.10.254
  ```
- **Note:** A gateway shoud accessibles from the LAN.
- The main of this problem is it.
- __Note:__ Gateway ususally is like `192.168.10.1` or `192.168.10.254`

1. `ip addr` -> Check my ip, interface, CIDR, state and broadcast.
2. `ip route` -> Check default gateway ip.
3. `ping 192.168.10.1` -> Check the connection to the gateway.
4. `ping 4.2.2.4` -> Check connection to the Internet.
5. `traceroute 4.2.2.4` -> Check that where is the problem

---

# Day 12

## What I learned

- Learn exactly what happens when you type `google.com` into your browser

## Challenges

1. Why do we need DNS? DNS translates human-readable domain names into IP addresses so clients can locate and communicate with servers without remembering numeric IP addresses. 
2. What's the difference between A and CNAME? An A (Address) DNS record maps a hostname to an IPv4 address and uses for lookup while CNAME (Conanical Name) DNS record maps an alias domain name to another domain name and doesn't map to an IP.
3. What is MX? An MX record specifies which mail server is responsible for receiving email for a domain.
4. What's the difference between `/etc/hosts` and DNS? `/etc/hosts` is a local file and in the most Linux distros usually this file lookup in the first and then DNS server will check and this order is according to Name Service Switch (`/etc/nsswitch.conf`).
5. What does `dig` do? `dig` is a DNS lookup utility used to query DNS servers and inspect DNS records such as A, AAAA, MX, NS, TXT, and CNAME.

## Notes

- Follow this format:
```bash
Hypothesis:
I think ...

Command:
...

Expected Output:
...

Conclusion:
...
```
- `google.com` -> Server cannot resolve!
**Answer:**
"Server cannot resolve" probably means DNS problem, not Internet.
1. `ping 4.2.2.4` -> Does the Internet work?
2. `ping google.com` -> Does the DNS broke? -> If `Temporary failure in name resolution` means the DNS doesn't work.
3. `cat /etc/resolv.conf` -> What's my resolver? -> Is it `8.8.8.8` or `127.0.0.53` or empty?
4. `dig google.com` -> Does the DNS server answer? -> If Timeout, means the Resolver has a problem.
5. `traceroute 8.8.8.8` (No `traceroute google.com`) -> Is the path to DNS server ok? (If DNS was broken, `google.com` doesn't resolve and so traceroute doesn't start)

---

# Day 13

## What I learned

- ICMP
- Ping
- Path Troubleshooting
- DNS Troubleshooting
- Port Troubleshooting

## Challenges

1. What's the difference between `ping` and `traceroute`? `ping` uses ICMP Echo Request and Echo Reply messages to test connectivitiy and measure latency between two hosts. `traceroute` discovers the path to the destination by sending probe packets and receiving ICMP Time Exceeded messages from itermediate routers, showing each hop along the route.
2. Why can `ping` succeed while HTTP stil fails? Ping uses ICMP but HTTP uses TCP and may be HTTP port filtered or blocked by firewall. HTTP may also fail because the web server is down or not listening on port 80/443.
3. What's the difference between TCP and UDP when troubleshooting? TCP provieds reliable communication using acknowledgments and retransmissions, while UDP sends packets without guaranteeing delivery, ordering, or retransmission.
4. What does `ss -tuln` show? `ss -tuln` displays listening TCP and UDP sockets using numeric IP addresses and port numbers instead of resolving hostnames or service names. (t->TCP, u->UDP, l->Listening, n->Numeric)
5. What does LISTEN mean? LISTEN means that a service is waiting for incoming connection requests on a specific port.

## Notes

### Production Scenario

A user says:
> "I can ping the server, but the website doesn't open"

Answer:

1. `ping server` -> Checks whether the server is reachable and measures packet loss and latency.
2. `ss -tuln` -> Checks which TCP and UDP ports are listening on the server. (If the website is HTTP, lookup :80 and if the website is HTTPS, lookup :443)
3. `curl -I http://server`
4. `sudo ufw status verbose` -> Checks whether the firewall is active and which rules are configured.
5. `systemctl status nginx`
And if the problem doesn't solve:
6. `journalctl -u nginx`

**Workflow:**
```bash
Network
   ↓
Port
   ↓
HTTP
   ↓
Firewall
   ↓
Service
   ↓
Logs
```

---

# Day 14

## What I learned

- What exactly is the service and port communicating on this network?

## Challenges

1. What's the difference between TCP and UDP? TCP is connection-oriented and provides reliable, ordered delivery using acknowledgments, sequence numbers, and retransmissions. UDP is connectionless and provides low-overhead, best-effort delivery without guaranteeing delivery or ordering.
2. Why does TCP use a three-way handshake? 
```bash
SYN
↓
I want to establish a connection.

SYN + ACK
↓
I received your request, and I also want to establish a connection.

ACK
↓
I received your response.

Connection Established
```
3. What's the difference between a port and a socket? A port is a logical number used to indentify a network service or endpoint on a host. A socket is an endpoint identified by an IP address, port number, and transport protocol.
4. What does `ss -tulpn` show? It shows TCP and UDP listening sockets, including the associated processes, using numeric addresses and ports.
5. What's the difference between HTTP and HTTPS? HTTPS is HTTP over TLS. TLS provides encryption, authentication, and integrity for HTTP communication. A digital certificate is used as part of the TLS authentication process.
6. What does `curl -I` do? It sends a HEAD request and displays the HTTP response headers without downloading the response body.
7. What's the difference between HTTP 404, 502 and 503?
```bash
404
↓
Resource not found

502
↓
Gateway/Proxy received an invalid response
from the upstream server

503
↓
Service is currently unavailable
```

## Notes

1. TCP Handshake
```bash
Client                  Server

  SYN ──────────────────→
      ←──── SYN + ACK ───
  ACK ──────────────────→

       Connection Established
```
2. HTTPS
```bash
HTTP
 ↓
TLS
 ↓
TCP
 ↓
IP
```
3. Socket
```bash
IP + Port + Protocol
        ↓
      Socket

like: 192.168.1.10:443/TCP
```

---

# Day 15

## What I learned

- Recognize Linux network interfaces
- Check IP and Gateway
- Know the difference between `ip addr` and `ip route`
- Read and interpret route
- Create simple static routes and remove them
- Know `default route`
- With `ip route get` you can find out which interface and gateway a packet sxits from
- Troubleshoot a simple network problem step by step

## Challenges

1. What's the difference between `ip addr` and `ip route`? `ip addr` shows interfaces, IPs, MACs, status of interfaces & ... while `ip route` shows routing table and using routes that the kernel uses for sending packets.
2. Analyze the Route: `default via 192.168.1.1 dev wlp4s0`? Default route uses default gateway; via means with this gateway IP; `192.168.1.1` is gateway IP; dev shows interface name; wlp4s0 is interface name.
3. Output of `ip route get 8.8.8.8` is `8.8.8.8 via 10.0.0.1 dev eth0 src 10.0.0.50`; Answer:
- What's Destination? It's 8.8.8.8
- What's Gateway? It's 10.0.0.1
- What's Interface? It's eth0.
- What's Source IP? It's 10.0.0.50
4. This is our situation:
**This is one of important Troubleshooting patterns.**
```bash
ping 8.8.8.8       → SUCCESS
ping google.com    → FAILED
```
What's the problem? The problem probably is DNS resolution problem. To ensure: `resolvectl status`, `dig google.com` and `cat /etc/resolve.conf`
5. This is our situation:
```bash
ip addr → IP exists
ip route → no default route
```
What's the problem? A default route didn't set. The system may have active interfaces, may have an IP, but: `default via ...` doesn't exist in the Routing Table. This can connects with some of local network hosts but doesn't have route for other networks.

## Notes

- When a Server says:
> I can't connect to X.
```bash
1️⃣ Do I have an IP?
       ↓
   ip addr

2️⃣ Do I have a route?
       ↓
   ip route

3️⃣ Which route will Linux choose?
       ↓
   ip route get X

4️⃣ Can I reach the destination?
       ↓
   ping X

5️⃣ Is DNS the problem?
       ↓
   dig X

6️⃣ Is the application/service reachable?
       ↓
   curl / ss / nc
```

---

# Day 16

## What I learned

- TCP/UDP & Port Troubleshooting
- When a server doesn't connect to service X: Recognize the problem is from Firewall, Protocol, Port, Network, or the Service?

## Challenges

A user says:
> "MiniShop won't open."
We have these information:
```bash
Server IP: 192.168.100.7
Nginx Port: 80
Backend Port: 3000
PostgreSQL Port: 5432
Redis Port: 6379
```

**Questions:**
1. What command do you run first to see if the server has an IP address? I run `ip -br addr` on the server in the first. Check IP & status of interfaces.
2. How do you check Routing? I check routing table with `ip route` command.
3. How do you check if Nginx is listening on port 80? I check it with `ss -tln | grep :80` and output is like `tcp LISTEN 0 511 0.0.0.0:80`.
4. How do you find the process associated with port 80? I find process with using `sudo ss -tlnp | grep :80`. 
5. How do you check from the client if port 80 is accessible? I run `nc -zv 192.168.100.7 80`.
6. How do you check HTTP Response? HTTP/Application/Proxy tests by `curl -I 192.168.100.7`
7. If port 80 is open but `curl` returns error 502, where's probably problem? The problem isn't from External Gateway or Router necassarily. 
```bash
502
 ↓
Nginx
 ↓
Backend unreachable
```
Check `curl http://127.0.0.1:3000` or `ss -tlnp | grep :3000`
8. If Backend is listening on the `127.0.0.1:3000`, does can the Nginx connect to that on the server? Yes, Nginx can connect to the server because they are on the same server.
9. If Backend be on the `127.0.0.1:3000`, does can connect an another server to that directly? No, Backend IP is localhost IP, so just local services can connect to it.
10. If PostgreSQL be on the `127.0.0.1:5432`, does can connect Backend on the server to that? Yes, Backend can connect to port 5432 on the server and actually connect to PostgreSQL.

## Notes

### Production Scenario

> Nginx is running, but users cannot access the website.

What do you do?

1. `ip -br addr` -> Check the iterfaces.
2. `ip route` -> Check the routing table.
3. `sudo ss -ltnp | grep :80` -> Check status of port 80 listeing.
4. `sudo ufw status verbose` -> Check the server firewall.
5. `curl -I http://127.0.0.1` -> Check the local HTTP.
6. `curl -I http://192.168.100.7` -> Check the server IP HTTP.
7. `nc -zv 192.168.100.7 80` -> Check the remote port from client (from another system).
8. `sudo journalctl -u nginx` -> Check the logs.
9. `sudo tail -f /var/log/nginx/error.log` -> Follow logs of nginx.

### Troublshooting workflow

```bash
IP problem?
     ↓
Routing problem?
     ↓
Port problem?
     ↓
Firewall problem?
     ↓
Nginx problem?
     ↓
HTTP/Application problem?
```

---

# Day 17

## What I learned

- Docker Fundamentals.
- Explain what is docker & why use it?
- Explain docker architecture.
- Know docker client & docker daemon.
- Recognize Image & Container.
- Create, Run, Stop & Remove a container.
- Check status & information of container.
- Understand the relationship between docker concepts and Linux

## Challenges

1. What is docker and why do we use it? Docker is a containerization platform used to package applications and their dependencies into portable containers, providing consistency across different environments.
2. What's the difference between a Docker Image and a Container? Docker Image is a read only template that is used for creating containers, containing the application code and dependencies. A Docker Container is a lightweight, runnable instance of Docker Image.
```bash
Docker Image
     │
     │ docker run
     ▼
Container
```
3. What's the difference between a Container and a Virtual Machine? A Container shares the host kernel, while a VM runs its own guest OS kernel. Containers generally require fewer resources and start faster than VMs because they share the host kernel.
4. What is the Docker Deamon? The Docker Deamon actually is the server side of a Docker platform that manages Images, Containers, Networks and Volumes.
```bash
Docker CLI
    │
    │ Docker API
    ▼
Docker Daemon
    │
    ├── Containers
    ├── Images
    ├── Networks
    └── Volumes
```
5. Why does this Container stop immediately `docker run ubuntu`? `docker run ubuntu` starts the container's default command, which is Bash. Since there is no interactive terminal attached, Bash exits, and because the main process exits, the container stops.
```bash
bash exits
   ↓
PID 1 exits
   ↓
Container stops
```
6. What's the difference between `docker ps` and `docker ps -a`? `docker ps` shows running containers while `docker ps -a` shows all containers, even created containers and stoped containers.
7. What's the difference between `docker stop` and `docker rm`? `docker stop` stop a container while `docker rm` remove a container.

**Note**
- Image: Read-only template
- Container: Runnable instance of an Image
- Process: The Container lives as long as its main process lives.

```bash
Image
  │
  │ docker run
  ▼
Container
  │
  ▼
Main Process
  │
  ├── running → Container Running
  │
  └── exits   → Container Stopped
```

## Notes

- Don't troubleshoot the Docker daemon first when the Docker daemon is already clearly working.
- Team says:
> The Docker container is running, but the application inside it is not working.

What do you do?

Answer:
1. `docker ps` -> Container status -> Container is running or not.
2. `docker ps -a` -> The container exists? Running? Exited? Created? What's its status?
3. `docker logs <container>` -> Check logs of cotainer.
4. `docker top <container>` -> Check processes inside container.
5. `docker inspect <container>` -> Check configuration.
6. `systemctl status docker` -> Check the problem is Docker Engine or not.
7. `journalctl -u docker -n 100 --no-pager` -> Check logs of docker itself.

---

# Day 18

## What I learned

- Read a Dockerfile
- Know CMD, RUN, COPY, WORKDIR, FROM & EXPOSE
- Create a personal Docker Image
- Run a Container of my Image
- Know the difference between CMD & RUN
- Inspect & Test Dokcer Image
- Create the first Dockerfile for MiniShop


## Challenges

1. What is a Dockerfile? A Dockerfile is a text file that contains a set of instructions used to build a Docker image.
2. What is the porpuse of `FROM`? `FROM` specifies the base iamge for the new image in a Dockerfile.
3. What's the difference between `RUN` and `CMD`? `RUN` executes a command when building the image while CMD runs a command when a container is creating.
```Bash
RUN → build time
CMD → container runtime
```
4. What's the porpuse of `WORKDIR`? `WORKDIR` sets the working directory for subsequent Dockerfile instructions and for the container`s runtime process.
5. What's the difference between `COPY` and `RUN`? `COPY` copies files from the build context into the image, while `RUN` executes commands during image building.
6. What does `EXPOSE 3000` means? It says to Docker, this container is expected to listen on port 3000.
```Bash
EXPOSE
   ↓
Documentation / metadata

-p 3000:3000
   ↓
Publish / Port Mapping
```
7. What's the difference between `docker build` and `docker run`? docker build converts a Dockerfile to an image while docker run runs an image and creates a container of the image.
```Bash
docker build
    ↓
Dockerfile
    ↓
Image
```
```Bash
docker run
    ↓
Image
    ↓
Container
    ↓
Main Process
```
8. What does `docker run -p 8080:80 nginx`? It creates & runs a container from nginx image and connects port 8080 of host system to port 80 of container.
9. Why is this usually better
```Dockerfile
COPY package*.json ./
RUN npm install
COPY . .
```
than:
```dockerfile
COPY . .
RUN npm install
```
? `npm dependencies` are in the package*.json, so after the first running image, until package*.json doesn't change, docker uses its cache to RUN npm install , if even other build context changed, but in the second architucture, if every file changed in the build context, docker ignores cache and check the files again to copy and runs `RUN npm install` again. It's slower.
10. If a container starts and immediately exits, what would you check first? `docker ps` -> `docker ps -a` -> `docker logs container_name` -> `docker inspect container_name`.

## Notes

```Bash
RUN  → BUILD TIME
CMD  → CONTAINER RUNTIME

EXPOSE → DOCUMENTATION
-p     → PORT PUBLISHING

IMAGE  → TEMPLATE
CONTAINER → RUNNING INSTANCE
```

### Production Scenario

Team says:
> We built the MiniShop backend image, but the container exits immediately.

Troubleshooting:

1. `docker ps` -> I check that my contaienr is running or not.
2. `docker ps -a` -> I check my container created or not.
3. `docker logs minishop-backend` -> If container is created, I check the logs of it.
4. `docker inspect minishop-backend` -> If I don't find out to solve, I check inspect data, specially Config, State, NetworkSettings & Mounts parts.
5. `cat Dockerfile` -> `vim Dockerfile` -> I check Dockerfile again.

Production Question:
Assume `docker ps -a` shows:
```Bash
minishop-backend   Exited (1)
```
And `docker logs minishop-backend` shows:
```Bash
npm ERR! Missing script: "start"
```
Where is the problem?
Is Docker daemon or Container or Application / package.json?

The log: `npm ERR! Missing script: "start"` -> The problem returns to npm start , so the main problem probably is from package.json. the scripts & start part has a problem, so I check the package.json file, fix the problem, build & run again.

---

# Day 19

## What I learned

- Explain the Docker network concepts.
- Know Default `bridge` network.
- Make Custom Brdige Network.
- Connect containers to a Network.
- Know the difference between `none` & `bridge`.
- How the containers find together with their IPs & Names.
- Don't confuse Port Mapping with Docker Network.
- Create a simple connection between two containers and test it.
- Troubleshoot the problem "Container A doesn't connect to Container B".

## Challenges

1. What is Docker networking? Docker networking enables containers to communicate with each other and with external networks using virtual interfaces, IP addresses, and DNS-based name resolution.
2. What's the difference between the default `bridge` network and a custom bridge network? A default bridge network is the default network of newly containers but custom bridge is created with `docker network create` and the containers add to that. containers just communicate with using IP addresses in default bridge while they can communicate with name-based automatically in the custom bridge network. User-defined/custom bridge has internal Docker DNS. custom bridge network is more secure too.
3. What's the difference between bridge, host, and none networks? bridge is Docker default network for containers and It creates communication with using IP addresses between containers. host network uses from host network stack, easier access but less isolation; Doesn't have a separate network namespace and uses Host networking directly. none almost has no network access.
4. How can two containers communicate with each other? They can communicate with using IP address or somewhere with name-based method like custom bridge.
5. Why can containers on the same custom network communicate without `-p`? Because they don't need to connect to outside of Docker for create communication in a same custom network. by the way they can connect to each other with container name (name-based) in a same custom netowork. `-p` is for publishing container port to Host/External Network.
6. What does `-p 8080:80` mean? It means connect port 8080 of host computer to port 80 of the container.
7. What's the difference between `backend:3000` and `localhost:3000`? The first means the backend container on port 3000 in a same custom network while the second means localhost (main system) on port 3000.
8. How can you find a container's IP address? I can find NetworkSettings in `docker inspect container_name` | `docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name`. 
9. How can you inspect a Docker network? With `docker network inspect container_name`.
10. Why is hard-coding a container IP usually a bad idea? Because I can create a communication with container names very simply while IPs may change and I need to configure again. Container may recreates and got a new IP.

## Notes

### Scenario

You have this in MiniShop:
```Bash
Frontend Container
       │
       ▼
Backend Container
       │
       ▼
PostgreSQL Container
```
Every three containers shoud be on the `minishop-net` network.

But Developer says:
> Frontend cannot connect to Backend.

Check step by step:
1. `docker ps` -> Are two containers running?
2. `docker network inspect minishop-net` -> Are two containers in the network?
3. `docker exec -it frontend sh` -> `getent hosts backend` -> Is Backend resolivng?
4. `nc -zv backend 3000` -> Is TCP Port 3000 accessible?
5. `curl http://backend:3000` -> If it's HTTP, Check the application.

### Mental Model

```Bash
Container Running?
        ↓
Same Network?
        ↓
DNS resolves?
        ↓
TCP Port reachable?
        ↓
Application responds?
```

---

# Day 20

## Targets of day

- Explain the persistence concept.
- Understand why data inside a container is temporary.
- Know Docker Volume.
- Create Named Volume & manage it.
- Understand Bind Mount.
- Know the difference between Volume & Bind Mount.
- Keep PostgreSQL data with Volume.
- Understand the difference between delete Container and Delete Volume.
- Troubleshoot the problem of database data loss.


## Challenges

1. Why is data inside a normal container considered ephemeral? Data stored in the container's writable layer is tied to the container. It remains while the container exists, but it is lost when the contaienr is removed and recreated.
2. What happens to data in the container writable layer when the container is removed? When the container is removed, data stored only in its writable layer is removed with it.
3. What is a Docker Volume? A Docker Volume is persistent storage managed by Docker and independent of the lifecycle of a particular container.
4. What's the difference between a Named Volume and a Bind Mount? A named volume managed by Docker and Docker specifies storage path while a bind mount managed by User/Host and the user specifies storage path.
5. Why are volumes important for databases? Databases need persistent storage because their data must survive container replacement. Docker Volumes provide a convenient way to persist database data independently of the container lifecycle.
6. What does this mean?
```Bash
-v postgres-data:/var/lib/postgresql/data
```
Mount the named Docker volume `postgres-data` at `/var/lib/postgresql/data` inside the container.
```Bash
-v postgres-data:/var/lib/postgresql/data
        │                     │
        │                     └── Container path
        └── Docker Volume name
```
7. What happens if you remove the PostgreSQL container but keep its volume? I can recreate the container and use from the past volume address and remain all those data.
8. How can you list Docker volumes? with `docker volume ls`.
9. How can you inspect a Docker volume? with using `docker volume inspect volume_name` command.
10. What would happen to the database data if you remove both the container and its volume? Data stored in the volume, so if I remove a volume, the database data removed too.

## Notes

### Scenario

Team says:
> We deleted the PostgreSQL container and all customer data disappeared.

You shoud troubleshoot in the first:

1. `docker ps -a` -> Does exist the container?
2. `docker volume ls` -> Does exist the volume?
3. `docker volume inspect postgres-data` -> Check the volume exists or not!?
4. `docker inspect minishop-postgres` -> If the container exists, so:
5. Check `postgres-data` is mounted to `/var/lib/postgresql/data` in `Mounts`.

### Second Scenario

Suppose:
```Bash
Container = deleted
Volume = exists
```
Data isn't lost and you can run a new container with the same volume.

### Third Scenario

```Bash
Container = deleted
Volume = deleted
```

In this scenario, you can't recovery data from volume.

# Day 21

## Targets of day

- Explain Docker Compose.
- Understand structure of `compose.yaml`.
- Learn Service concept.
- Manage some containers with a file.
- Define Volume in the Compose.
- Use Environment Variables.
- Work with `docker compose up/down/ps/logs/exec`.
- Run MiniShop Backend + PostgreSQL by Compose.
- Understand tthe difference between `docker run` and `docker compose`.

## Challenges

1. What is Docker Compose and why do we use it? Docker Compose is a tool for defining and running multi-container applications. it improves consistency, reduces manual errors, and makes development and deployment workflows easier to reproduce.
**Note:** Docker Compose usually is suitable for testing, local development and deployments.
2. What's the difference between `docker run` and `docker compose up`? `Docker run` creates & runs a single container while `docker compose up` runs a compose.yml file that contains some services, volumes, networks & ... and it's for multi-container applications.
```Bash
docker run
   ↓
single container
```
```Bash
docker compose up
   ↓
multiple services
```
3. What is a Service in Docker Compose? A Service is a declarative definition of a containerized application component in the Compose file, including its image or build configuration, ports, networks, volumes, environment, and other settings.
4. Why can a backend container use `postgres:5432` instead of `localhost:5432`? It's true when we defined DB_HOST: postgres; it means my database is in postgres & the postgres is a service in the compose file.
```Bash
backend
   ↓
DNS
   ↓
postgres
   ↓
TCP 5432
```
5. What does `docker compose down` do? `docker compose down` stops and removes the Compose project's containers and networks. Named volumes are not removed by default.
6. What's the purpose of the `volumes:` section in a Compose file? The `volumes` section defines named volumes, and service's `volume` section specifies how those volumes are mounted into the container.
7. What does `depends_on` do? It shows an ordering. when a service is depends on another service, that another service will run in the first & than this service runs.
```Bash
depends_on
    ↓
Start/creation order
```
8. Does `dpeneds_on` guarantee that PostgreSQL is ready to accept connections? No, It only controls dependency order and does not guarantee that the dependency is ready to accept connections.
9. What does this mean?
```Bash
ports:
  - "3000:3000"
```
It means to connect port 3000 from host to the port 3000 of this service from compose file.
10. Why should passwords usually not be hard-coded in `compose.yaml`? Because it's not secure. for this reason we create a `.env` file, store sensitive data in that and use from variables in `compose.yml`. we put `.env` file in the `.gitignore` file too.


## Notes

### Scenario

Team says:
> The MiniShop backend container is running, but it cannot connect to PostgreSQL.

The information:
```Bash
Backend:
3000

PostgreSQL:
5432

Compose Network:
default project network
```

1. `docker compose ps` -> Are they running? (backend & postgres)
2. `docker compose logs postgres` -> Does PostgreSQL really show it?
```Bash
database system is ready to accept connections
```
3. `docker compose exec backend sh` -> `getent hosts postgres` -> Does DNS work?
4. `nc -zv postgres 5432` -> Does TCP connection connect?
5. `docker compose config` -> Check Environment -> Does it have `DB_HOST=postgres` & `DB_PORT=5432`?
6. `docker compose logs backend` -> If you see `ECONNREFUSED` or `password authentication failed` or `getaddrinfo ENOTFOUND postgres`, find every error is for what layer.

---

# Day 22

## Targets of day

- Understand the difference between `build` & `image` in Compose.
- Understand policy of `restart`.
- Understand & use `healthcheck`.
- Use `depnds_on` with healthcheck.
- Manage Environments better.
- Write a clean & maintainable Compose file.
- Connect Backend & PostgreSQL logically.
- Compose troubleshooting status of services.

## Challenges

1. What's the difference between `build` and `image` in Dokcer Compose? build makes an image according to a Dockerfile for a service like backend service while image just uses an image from registry like postgres:16.
2. What does `restart: unless-stopped` do? `restart: unless-stopped` tells Docker to automatically restart the container if it stops, unless the container was explicitly stopped by the user.
**Note:** Restart Policy is for failure recovery.
```Bash
Application crashes
      ↓
Container stops
      ↓
Docker restarts it
      ↓
Container runs again
```
3. What is Docker healthcheck? Docker healthcheck does some tests with some configurations according to that I want for ensure about health of a service.
4. Why is a healthcheck useful with `depends_on`? Because It starts a service & checks healthy and if the service was health, another service will start. if `depends_on` has `condition: service_healthy`.
```Bash
PostgreSQL starts
      ↓
Healthcheck runs
      ↓
Healthy ✅
      ↓
Backend starts
```
5. What's the difference between:
```YAML
depends_on:
  - postgres
```
and:
```YAML
depends_on:
  postgres:
    condition: service_healthy
```
? The difference is:
```Bash
depends_on:
PostgreSQL starts -> Backend starts

depends_on + Healthcheck:
PostgreSQL starts -> Healthy passes -> Backend starts
```
6. What does `docker compose config` do? `docker compose config` parses and renders the Compose configuration and helps validate the resulting configuration, including interpolated variables.
7. What's the difference between:
```Bash
docker compose build
```
and:
```Bash
docker compose up -d --build
```
? `docker compose build` just builds some images while `docker compose up -d --build` builds some images if was need and start serivces.
8. What does `restart: on-failure` do? `restart: on-failure` restarts the container when its main process exits with a non-zero exit code.
```Bash
exit 0 → normally stopped
exit 1 → failure → restart
```
9. How can you check the health status of a container? with using `docker compose ps` & `docker inspect --format='{{json .State.Health}}' container_name`.
10. Why shouldn't we use `latest` tags for important production services? Pinning a specific version makes deployments more predictable and reproducible and reduces the risk of unexpected breaking changes after an image update.
`image: postgres:16` is better than `image: postgres:latest`.

## Notes

### Scenario

> MiniShop Backend keeps restarting. PostgreSQL is running.

Answer:

1. `docker compose ps`
2. `docker compose logs backend`
3. `docker inspect minishop-backend`
4. `docker compose config`
5. `docker compose ps postgres`
6. `docker compose logs postgres` -> If PostgreSQL was unhealthy, Check:
7. `docker inspect minishop-postgres` -> Check part 'State -> Health'.

---

# Day 23

## Targets of day

- Manage Database Container correctly.
- Understand the difference between Database Backup and Container Backup.
- Get Backup from Docker PostgreSQL.
- Restore Backup.
- Know when don't remove Volume.
- Manage PostgreSQL by Docker Compose.
- Test Persistence in a real scenario.
- Have a Backup/Restore workflow for Database.
- Troubleshoot the production scenario related to the database crash.

## Challenges

1. What is the difference between ephemeral container storage and persistent volume storage? Ephemeral storage is writable layer on a container and if the container remove or recreate, the storage gone while a persistent volume has a lifecycle independent of the container.
2. What is `pg_dump`? `pg_dump` is a PostgreSQL command-line utility that creates a logical backup of a database, including its schema and data.
3. What is a logical database backup? A logical database backup contains a logical representation of database's schema and data, which can be restored to reconstruct the database.
4. What's the difference between `pg_dump` and backing up a Docker Volume? `pg_dump` is a logical database backup while Volume backup is a filesystem-level backup.
5. Why shouldn't we blindly copy PostgreSQL data files while the database is running? A live filesystem copy can capture an inconsistent state while PostgreSQL is modifying data, so the resulting backup may not be safely restorable.
6. How can you back up a PostgreSQL database running in Docker Compose?
```Bash
docker compose exec -T postgres \
pg_dump -U postgres -d minishop \
> minishop-backup.sql
```
7. How can you restore a SQL backup into PostgreSQL?
```Bash
docker exec -i minishop-postgres \
psql -U postgres -d restore_test \
< minishop-backup.sql
```
OR
```Bash
cat minishop-backup.sql | \
docker compose exec -T postgres \
psql -U postgres -d restore_test
```
8. What happens to the database data when the PostgreSQL container is remmoved but the volume remains? We can create a new container and use the same volume to add the data in the new contaier.
```Bash
Container A
     ↓
deleted ❌

Volume
     ↓
still exists ✅

Container B
     ↓
same volume
     ↓
Data remains ✅
```
9. What happens if both the PostgreSQL cotainer and its volume are removed? If both the cotainer and volume are deleted but a valid backup exists, we can create a new PostgreSQL cotainer and restore the database from the backup.
10. Why should we test database restores instead of only creating backups? Because we may loose data and need to restore the backups, so we need to ensure restoring backups work correctly.

## Notes

### Scenario

In the morning the team realizes:
> The PostgreSQL container was accidentally deleted.

Answer:

- `docker compose ps -a`
- `docker volume ls`

#### The first Scenario

```Bash
Container → Deleted
Volume → Exists
```

Can run a container with the same volume again.

#### The second scenario

```Bash
Container → Deleted
Volume → Deleted
Backup → Exists
```
Now:
```Bash
Backup
  ↓
New PostgreSQL
  ↓
Restore
  ↓
Data Recovered
```

#### The third scenario

```Bash
Container → Deleted
Volume → Deleted
Backup → Exists
Backup → Corrupted
```

> Backup is not enough; Backup should be restorable too.

---

# Day 24

## Targets of day

- Dive into Docker networing & troubleshooting

## Challenges

1. What is a Docker network namespace? A network namespace isolates a container's network stack, including its interfaces, IP addresses, routing table, and network connections.
2. How does a container get an IP address on a Docker bridge network? Docker gives to every container an IP address on every network when the container is connecting to that network. User-defined bridge has DNS resolution too so containers can connect together with their names.
3. What does `ip addr` show inside a container? It shows container interfaces. Interface name, IP addresses, MAC, State, IPv4/IPv6.
4. What does `ip route` show inside a container? It shows container routing table.
5. How does Docker provide DNS-based service discovery? Docker usually provides DNS-based service discovery on the user-defined bridge network and every container knows each other with its name in the same network.
6. Why is `backend:3000` preferred over a hard-coded container IP? Because it's more human-readable and the container IP may changes after removing, recreating and restarting.
7. What's the difference between `localhost:3000` and backend:3000` inside a container? `localhost:3000` mentions to inside the container on port 3000 while `backend:3000` mentions to backend container on port 3000 in the same network.
8. How can you test DNS resolution between two containers?
```Bash
docker exec -it first_contaier sh
getent hosts second_container
```
9. How can you test TCP connectivity between two containers?
```Bash
nc -zv server_name port
```
10. How would you troubleshoot a container that can resolve another container but cannot connect to its port? Production-oriented:
```Bash
1. docker ps
       ↓
2. docker network inspect minishop-net
       ↓
3. getent hosts backend
       ↓
4. nc -zv backend 3000
       ↓
5. curl http://backend:3000
       ↓
6. docker logs backend
```

## Notes

### Scenario:

> MiniShop backend is running, PostgreSQL is running, but Backend cannot connect to PostgreSQL.

Troubleshooting Order:
```Bash
1. Is PostgreSQL running?
2. Are both services on the same network?
3. Does postgres resolve?
4. Is port 5432 reachable?
5. Is PostgreSQL accepting connections?
6. Are DB credentials correct?
7. Is the Backend application configured correctly?
```

Commands:

1. `docker compose ps`
2. `docker network inspect <network>`
3. `docker compose exec backend sh`
4. `getent hosts postgres`
5. `nc -zv postgres 5432`
6. `wget -qO- http://postgres`
7. `docker compose logs postgres`
8. `docker compose logs backend`

---

# Day 25

## Targets of day

- What's Registry?
- What's Repository?
- What's Image Tag?
- Know the difference between `name:tag`.
- Know Docker Hub.
- Tag Image.
- Push Image.
- Pull Image.
- Run Image on another Docker Host.
- Know the difference between Registry Image and Local Image.
- Troubleshoot `Unauthorized`, `pull denied` and `tag does not exist` problems.

## Challenges

1. What is a docker registry? A docker registry is where stores images, manage them and share them publicly or privatly.
2. What's the difference between a Registry and Repository? A registry is a docker images storage while a repository is a space for an image in the registry.
3. What is an image tag? A human-readable refrence used to identify a particular version or variant of an image.
4. What does this mean?
```Bash
moein/minishop-backend:1.0
```
It's an image.`moein` is namespace/user, `minishop-backend` is image name /  repository and `1.0` is tag/version.
5. What's the difference between `docker build` and `docker push`? `docker build` converts a Dockerfile to an image while `docker push` pushs an image to a docker registry like docker hub.
6. What does `docker pull` do? `docker pull` downloads an image from registry on your host.
7. Why do we tag images before pushing them? Tags allow us to identify different versions or variants of the same repository.
8. What's wrong with relying on `latest` in production? `latest` doesn't mention to an unique tag/version of image and it can makes some errors.
9. What causes `denied: requested access to the resource is denied`? Possible causes include authentication failure, insufficient permissions, incorrect repository name, or attempting to push to a repository that does not exist or is not owned by the user.
So check:
```Bash
Login
   ↓
Repository
   ↓
Permission
   ↓
Tag
```
10. How can you deploy the same Docker image to another server? Build once, push once, pull and run anywhere.
```Bash
Developer Host
      ↓
docker build
      ↓
docker tag
      ↓
docker push
      ↓
Registry
      ↓
Production Server
      ↓
docker pull
      ↓
docker run
```

## Notes

### Scenario:

Developer says:
> "I built the MiniShop backend image on my laptop, but the production server doesn't have it."

```Bash
Developer Laptop
      ↓
docker build
      ↓
Image
      ↓
docker tag
      ↓
Registry
      ↓
docker push
      ↓
Production Server
      ↓
docker pull
      ↓
docker run
```

#### In my Laptop

1. `docker build -t minishop-backend:1.0 .` -> Build image.
2. `docker images` -> Check it.
3. `docker tag DOCKERHUB_USERNAME/minishop-backend:1.0` -> Create tag.
4. `docker rmi minishop-backend:1.0` -> Remove last image.
5. `docker push DOCKERHUB_USERNAME/minishop-backend:1.0` -> Push in registry.

#### In the Production

1. `docker pull DOCKERHUB_USERNAME/minishop-backend:1.0`.
2. `docker run -d --name minishop-backend --network minishop-net -p 3000:3000 DOCKERHUB_USERNAME/minishop-backend:1.0`

### Second Scenario

On the production, `docker pull username/minishop-backend:1.0` gives `pull access denied`.
What do you check?

1. `docker login` & `docker info` -> Check login info, specially Username.
2. `docker pull username/minishop-backend:1.0` -> Check namespace, repository name and tag.
3. Check to login before pull if it's a private repository:
```Bash
docker login registry_web_address
docker pull registry_web_address/username/minishop-backend:1.0
```
4. Check your permissions.
5. Check which registry Docker is actually contacting.

Quick diagnostic checklist:
```Bash
IMAGE="registry.example.com/username/minishop-backend:1.0"

# 1. Can I authenticate?
docker login registry.example.com

# 2. Try pulling the exact image/tag
docker pull "$IMAGE"

# 3. Check Docker's current configuration
docker info

# 4. Check where credentials are configured
cat ~/.docker/config.json
```

### Third Scenario

Developer says:
> "I pushed version 1.1, but production is still running the old version."

1. `docker images` -> Check current images in production.
2. `docker ps` -> What containers are running?
3. `docker inspect current_container_name` -> Check status of the current container.
4. `docker pull username/minishop-backend:1.1` -> Pull new version of image.
5. `docker stop minishop-backend:1.0` & `docker rm minishop-backend:1.0` -> Stop & remove the last container.
6. `docker run -d --name minishop-backend:1.1 --network minishop-net username/minishop-backend:1.1` -> Recreate a container with the new version of the image, if was necassary can add last volume to this container too.

