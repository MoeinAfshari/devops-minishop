# Docker Image Tagging

## Image Name

The image name tells Docker which image you're talking about. 

like:
```Bash
redis
postgres
ubuntu
mycompany/myapp
```

## Tag

A tag is a label attached to a particular image.

Like:
```Bash
nginx:1.25.3
     └──────┘
       tag
```

**Important**: Docker doesn't require tags to follow Semantic Versioning.

For example, all of these are valid tags:
```Bash
myapp:hello
myapp:production
myapp:v2
myapp:2026-09-01
```

## Version

Version is a concept, not a special Docker field.

When people say:
> "What version of this Docker image are you using?"

They often mean the tag: `myapp:2.4.1` -> `2.4.1` is a tag and can be a version.

## `latest`
`latest` is just a tag.

For example:
```Bash
docker pull nginx:latest
```
means:
> "Give me the image currently pointed to by the `latest` tag."

The image publisher decides what `latest` points to.

## Semantic Versioning

Semantic Versioning (SemVer) is a convention for writing versions:
```Bash
MAJOR.MINOR.PATCH
```
For example:
```Bash
2.4.1
│ │ │
│ │ └── PATCH
│ └──── MINOR
└────── MAJOR
```
Generally:
- MAJOR -> breaking/incompatible changes.
- MINOR -> new backward-compatible functionality.
- PATCH -> backward-compatible bug fixes.

Docker doesn't enforce these rules. Your team or the image publisher chooses to use SemVer.

Sumppose you see:
```Bash
docker.io/mycompany/myapp:2.4.1
```

You can break it down as:
```Bash
docker.io        / mycompany / myapp : 2.4.1
│                   │          │        │
│                   │          │        └── tag / version
│                   │          └─────────── image name / repository
│                   └────────────────────── namespace / user
└────────────────────────────────────────── registry
```
