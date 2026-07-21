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
