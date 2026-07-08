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

