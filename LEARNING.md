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

