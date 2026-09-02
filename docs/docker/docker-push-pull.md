# Docker Push & Pull

## `docker tag`

Creates a new image from a source iamge and I can give to that new image namespace, image name and tag.

```Bash
docker tag <source_namespace>/<source_name>:<soruce_tag> <target_namespace>/<target_name>:<target_tag>
```

For example:
```Bash
docker tag moeinafshari/minishop-backend moein/minishop-backend-test:1.0
```

## `docker push`

Pushes an image to a Docker registry. Docker Hub is default Docker registry.

```Bash
docker push YOUR_DOCKER_USERNAME/REPOSITORY_NAME:TAG
```

For example:
```Bash
docker push moeinafshari/minishop-backend:1.0
```

## `docker pull`

Pulls an image from a Docker registry. Docker Hub is default Docker registry.

```Bash
docker pull YOUR_DOCKERHUB_USERNAME/REPOSITORY_NAME:TAG
```

For example:
```Bash
docker pull moeinafshari/minishop-backend:1.0
# or
docker pull alpine:3.5
```

## Authentication

You can authenticate to any public or private registry for which you have credentials. Authentication may be required for pulling and pushing images. Authentication credentials are stored in the configured credential store. If you use Docker Desktop, credentials are automatically saved to the native keychain of your operating system. If you're not using Docker Desktop, you can configure the credential store in the Docker configuration file, which is located at `$HOME/.docker/config.json on` Linux.

When run `docker push ...` may you get `unauthorized`.
Perhaps:
- Didn't login.
- Token was a mistake.
- Repository was for another user.
- Didn't have permission.

## Troubleshooting

1. `denied`:
Authentication/Permission/Repository name -> `denied: requested access to the resource is denied`.
2. `tag does not exist`:
Like:
```Bash
manifest unknown
```
Means Tag doesn't exist.
Check it:
```Bash
docker images
```
3. `pull access denied`:
`pull access denied` may:
- Repository is private.
- Don't login.
- Mistake image name.

**Check Repository**

Before Push:
```Bash
docker image ls
```
Check exact name.

**Note: Don't use latest.**
