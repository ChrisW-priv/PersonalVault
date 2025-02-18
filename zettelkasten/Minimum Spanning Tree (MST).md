---
title: "Minimum Spanning Tree (MST)"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

## Definition

On an [Undirected Graph](Undirected%20Graph.md) and [Weighted Graph](Weighted%20Graph.md), a Minimum Spanning [Tree](Tree.md) is a subset of the edges in the graph which connects all vertices together (without creating any cycles) while minimizing the total cost.

## Code

### Prim's Algorithm

Good for dense graphs. Usually will work in $O(E\cdot log(E))$ but it can be optimized to $O(E\cdot log(V))$.
It is not easily parallelizable. Neither can do minimum spanning forest on disconnected graph.

### Krushal's & Boruvka's algorithm

Supposedly better than prims

## Intuition
