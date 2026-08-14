# Docker Introduction

## What is Docker?

Docker is the containarization platform that is used to package your application and all its dependencies together in the form of containers to make sure that your application works seamlessly in any environment which can be developed or tested or in production.

## Why Docker?

Docker is popular because it offers portability, consistency, and scalability for deploying applications in different environments. Docker containers are lightweight, isolated, and easy to deploy, making them a popular choice for modern application development and deployment.

## Benefits of Containerization

- Portability: Runs anywhere in local machine, cloud, on-perm servers.
- Consistency: Same behavior in development, testing, and production.
- Lightweight: No full OS per app; containers share the host kernel.
- Scalability: Ideal for microservices and orchestrators like Kubernetes and Doker Swarm.
- Efficiency: Starts in seconds, uses fewer system resources.

## Docker vs VM

| Feature |  VM  | Container |
| :-----: | :--: | :-------: |
| Kernel | Separate | Host Kernel |
| Boot Time | Slow | Fast |
| Size | Usually larger | Usually smaller |
| Isolation | Strong | Process-level isolation |
| Resource Usage | Higher | Lower |

**Note:** A container shares the host kernel, while a VM runs its own guest OS kernel.
  
