# User Management

## User & Group

What's the difference between User & Group? User is an account; A user represents a person or a service account that can log in and access system resources. you can change between users with `su` command. but Group is a set of difference users that they have access to files & directories according to group permissions for those.

## Owner

What's Owner? The owner of a file or directory has primary control over it and can modify its permissions and ownership (with sufficient privileges).

## Permissions

What's Permission? Permission includes read, write & executable accesses that can be difference for owner, group & other.

## /etc/passwd

4. What's the structure of `/etc/passwd`? username:password placeholder (x, *, !):UID:GID:Comment (GECOS):Home Directory:Login Shell

## /etc/shadow

What's the structure of `/etc/shaddow`? username:encrypted password:last changed password time:minimum days to change password after last change:maximum days to doesn't change password:days number for warning message before end of maximum days:days to inactive account after expire time:expire time to remove account

## Best Practices

What's the best way to manage users in a server? The best practice is to manage users with commands such as `useradd`, `usermod`, `passwd`, and `groupadd` instead of editing `/etc/passwd` or `/etc/shadow` manually.
