# Docker Build

## Docker Build Definition

Docker Build is one of the key features of Docker Engine, specifically designed to create container images. It plays an important role in the software development lifecycle by enabling developers to package applications and deploy them consistently across multiple environments. Docker Build isn't just for creating images; it is integral to both simple and complex workflows, making it a crucial tool for developers. By automating the image creation process, Docker Build ensures that applications are deployed smoothly and reliably, offering consistency across different platforms.

## Syntax of Docker Build Command

`docker build [OPTIONS] PATH | URL`

| Docker Build Option | Usage | Example of Usage |
| :-----------------: | :---: |
| -t / --tag | This option lets you tag the image with a name and version (formatted as 'name:tag') | `docker build -t myapp:1.0` |
| -f / --file | Use this option to specify a custom Dockerfile instead of the default './Dockerfile'. | `docker build -f Dockerfile.dev -t myapp:dev .` |
| --build-arg | It’s useful for setting environment-specific configurations. | `docker build --build-arg ENVIRONMENT=production -t myapp:prod .` |
| --no-cache | If you want to skip using cached layers and force a fresh build, this option ensures each step in the Dockerfile is re-executed. | `docker build --no-cache -t myapp:latest .` |
| --rm | This option automatically removes any intermediate containers created during the build. It’s enabled by default, but you can turn it off if needed. | `docker build --rm=false -t myapp:test .` |
| --pull | Forces Docker to pull the latest version of the base image before starting the build, ensuring your build uses the most current base image. | `docker build --pull -t myapp:latest .` |
| --target |  When using a multistage Dockerfile, this option allows you to build up to a specific stage by providing the stage name. This is helpful when testing specific parts of a multistage build. | `docker build --target builder -t myapp:builder .` |
| --compress | Compresses the build context before sending it to the Docker daemon, which can help reduce data transfer times for larger projects. | `docker build --compress -t myapp:compressed .` |
| --label |  Adds custom metadata to the image as key-value pairs. You might use this to include version details, author information, or other metadata. | `docker build --label version="1.0" --label maintainer="user@example.com" -t myapp:labeled .` |
| --network | Sets the network mode for the build, like 'bridge', 'host', or 'none', which can be useful when the build process needs network access. | docker build --network host -t myapp:hostnetwork . |

