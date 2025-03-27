---
title: Implement graph theory into library
description: Library to make working with graph easy
date: 2025-03-01
tags:
  - project
important: false
status: todo
---

> [!Important]
> I can actually just use some pre-defined libs, Graph theory is a well known problem.
>
> This will allow me to do many of the ideas I have way faster. If I'm still bottle-necked -> then I should implement


I am thinking to implement graph theory algorithms in a sqllite3 compatible way. 

idea: make a graph implementation inside postgres or sqlite or duckdb. 
The last one seems to be the most promising one.

edges are just objects with atributes,
all releations are stored as a long list of edges in the db

nodes are also classes that may have some atributes

So there are 3 classes:

- node_attr
- edge_attr
- edge: node1_id, node_2_id, edge_attr.id

immediate thought: edge list is said to be least efficient: investigate the optimization techniques.

maybe store data as edge list in stg table but pre compute some adjacency list or even adjacency matrix?

## Action Items

- [ ] define and implement types
    - I'm thinking: relations as a-b pairs and nodes as generic relations of id-> other table row
- [ ] implement select algorithms in python to test the ideas
- [ ] define stable import/export on the thing
- [ ] implement it in c style lang (maybe zig or rust?) and add links to python
