# Docker - Managing Ports

## Concept

Docker containers run in isolated network namespaces. By default, they are unreachable from the host or the internet. To make a service accessible, we must bridge the gap between the Container Network and the Host Network.

## Syntax & Example

`docker run -p <Host_IP>:<Host_Port>:<Container_Port>/<Protocol> <Image>`

Example:

`docker run -p 8080:80 --name webhost -d nginx`

Let's break this command:
1. Docker run Nginx: will start the container from the Nginx image.
2. -p 8080:80: will map TCP port 80 in the container to port 8080 on the Docker host.
3. --name webhost: will name our container webhost, if not specified docker will give it a random name.
4. -d: flag will run docker in a detached mode that is,  in the background.

