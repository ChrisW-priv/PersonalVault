---
title: Dijkstra's algorithm
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

> [!Important]
> Dijkitra's algorithm can ONLY be run on graph with no negative edge weights.
> This allows us to let the algorithm act in a greedy manner.

## Definition

Dijkstra's algorithm is a solution to Single Source Shortest Path ([SSSP](SSSP)) for non-negative [Weighted Graph](Weighted%20Graph.md)

Typically the efficiency of this algorithm is $O(E+log(V))$ which is really competitive against other algorithms.

> [!Notice]
> Dijkstra's algorithm is just [Breadth First Search (BFS)](Breadth%20First%20Search%20(BFS).md) but on [Weighted Graph](Weighted%20Graph.md).
> If you were to "unwrap" the edges to make the graph unweighted, then it is basically a BFS (with number of nodes as the weight).
