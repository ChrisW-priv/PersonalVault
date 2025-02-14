---
title: "Low-link Values in a graph"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

# Low-link Values in a graph
## Definition
A low-link values of a node is the lowest node id reachable from that node when doing [Depth First Search (DFS)](Depth%20First%20Search%20(DFS).md) (including itself).

Using low-link Values in the graph can be used to find cycles in the [Graph](Graph.md).

Important: if our low-link values are used to detect [Strongly Connected Component (SCC)](Strongly%20Connected%20Component%20(SCC).md) Then the result of the operation is dependent on the randomness of the starting position of DFS. Therefore we sometimes have to incorporate a set of values that we are exploring currently. This way we always get the same result each time.