---
title: Topological ordering
description: Ordering of nodes in a graph, such that each each node is before the one that is "next" in the directed graph.
date: 2025-02-14
tags: 
categories:
  - zettelkasten
---

Topological ordering which is an order where for-each directed edge $(u,v)$ a
node $u$ appears before node $v$ in the ordering

## Intuition

If graph represents courses and node (u,v) represents couse u being prerequisite
for v then topological ordering is an order in which you can learn all courses
"in order" meaning all prerequisites are done before main courses.

Note: There often isn't just one unique topological order for a graph. 

Note: not every graph has topological order. Only 
[Directed Acyclic Graphs (DAG)](Directed%20Acyclic%20Graphs%20(DAG).md) do! that
is because you cannot start with any node if there is mutual dependency of nodes
