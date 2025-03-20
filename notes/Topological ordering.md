---
title: Topological ordering
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

Topological orderingwhich is an order where foreach directed edge (u,v) anode u appears before node v in the ordering.

## Intuition

If graph represents courses and node (u,v) represents couse u being prerequisite for v then topological ordering is an order in which you can learn all courses "in order" meaning all prerequisites are done before main courses.

Note: There often isn't just one unique topological order for a graph. 

Note: not every graph has topological order. Only [Directed Acyclic Graphs (DAG)](Directed%20Acyclic%20Graphs%20(DAG).md) do! that is beacause you cannot start with any node if there is mutual dependency of nodes
