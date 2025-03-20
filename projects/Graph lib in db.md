---
title: Graph lib in db
description: ""
date: 2025-03-06
tags:
  - project
important: false
---

idea: make a graph implementation inside postgres

implement it with django orm for easier visualisations etc.

edges are just classes with atributes, all releations are stored as a long list of edges in the db

nodes are also classes that may have some atributes

So there are 3 classes:

node_attr

edge_attr

edge: node1_id, node_2_id, edge_attr.id

immediate thought: edge list is said to be least efficient: investigate the optimization techniques.

maybe store data as edge list in stg table but pre compute some adjacency list or even adjacency matrix?

## Action Items

## Progress

Notes on what happened...

## Reflection

What went wrong? Why?
