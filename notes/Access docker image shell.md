---
title: Access docker image shell
description: ""
date: 2025-03-28
tags:
  - docker
categories:
  - zettelkasten
draft: true
---

## Access running docker image

list all running:

```bash
docker ps
```

Get sth like:

```bash
CONTAINER ID   IMAGE           COMMAND               CREATED         STATUS         PORTS                                           NAMES
52e57d44b5da   ollama/ollama   "/bin/ollama serve"   3 minutes ago   Up 3 minutes   0.0.0.0:11434->11434/tcp, :::11434->11434/tcp   ollama_coding
```

Access the `bash`:

```bash
docker exec -it 52e57d44b5da bash
```
