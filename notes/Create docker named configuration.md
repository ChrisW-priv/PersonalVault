---
title: Create docker named configuration
description: Configuration of the docker such that it can later be invoked with one name
date: 2025-03-28
tags:
  - Docker
categories:
  - zettelkasten
draft: false
---

Example of setting `timescaledb` configuration:

```
docker run -d --name timescaledb -p 5432:5432 -e POSTGRES_PASSWORD=password timescale/timescaledb-ha:pg16
```

Then, you can just start it with:

```
docker start timescaledb
```
