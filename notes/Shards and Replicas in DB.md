---
title: "Shards and Replicas in DB"
description: ""
date: "2025-05-21"
tags: 
categories:
  - zettelkasten
draft: false
---

Think of a _shard_ as just a slice of your overall dataset, stored on its own
server (or cluster node). Instead of one monolithic database that holds every
row from ID 1 to ID $\infty$, you have many smaller databases—each responsible
for only a subset of the rows.

Replicas are copies of the data (sharded or not) which allows better recovery
when one replica is unavailable as well as some parallel queries.
