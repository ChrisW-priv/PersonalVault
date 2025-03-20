---
title: Implement graph theory into library
date: 2025-03-01
description: ""
tags:
  - project
important: false
status: todo
---

I am thinking to implement graph theory algorithms in a sqllite3 compatible way. 

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

- [ ] define and implement types [important:: true] 
    - I'm thinking: relations as a-b pairs and nodes as generic relations of id-> other table row
- [ ] implement select algorithms [important:: true]
- [ ] define stable import/export on the thing [important:: true]

## Progress

Notes on what happened...

## Reflection

What went wrong? Why?
