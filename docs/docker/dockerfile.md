# Dockerfile

## What's Dockerfile?

A Dockerfile is a plain-text script that lists ordered instructions the Docker builder runs to assemble an image and automate creating containers.

```bash
Dockerfile
     ↓
docker build
     ↓
The Image
     ↓
docker run
     ↓
A Container
```

## An example of a Dockerfile:

```bash
FROM ubuntu:24.04

WORKDIR /app

COPY . .

CMD ["bash"]
```

## Image Layer Concept

Docker Image ususally is created from some layers. Docker cache some layers and so it can be faster.

## Most Important Docker Instructions

| Instruction | Description |
| :---------: | :---------: |
| FROM | Identifies the base image that will be used to create the new image. |
| COPY | Inserts data into the image from the host computer. |
| ADD | Like COPY, but with the capacity to extract tarballs and access files from URLs. |
| RUN | Continues out instructions within the image as it is currently being created. |
| WORKDIR | Defines the working directory for additional instructions inside the image. |
| CMD | Provides the default command that is going to be performed when the image-based container is started. |
| ENTRYPOINT | Comparable to CMD, but with an executable provided for when the container starts. |
| EXPOSE | Opens up a container's specified ports for external service communication. |
| ENV	| Sets the image's internal setting variables. |
| VOLUME | Creates a volume or mount point for saving data between container runs. |
| USER | Provides the user or UID that will be used to operate the container. |
| LABEL | Adds key-value formatted metadata to the image. |
| ARG | Defines variables to be provided to the Dockerfile during the build process at build time. |
| ONBUILD | Provides a command to be run when the image is used as the foundation for another build. |
| HEALTHCHECK | Provides a command for analyzing a container's health. |
| MAINTAINER | Indicates the Dockerfile's author or maintainer. |
