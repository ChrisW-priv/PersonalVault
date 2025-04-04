---
title: Bellman-Ford algorithm
description: The Bellman-Ford algorithm calculates the shortest paths from a single source to single target
date: 2025-02-14
tags: 
categories:
  - zettelkasten
---

## Definition

The Bellman-Ford algorithm is an [SSSP](SSSP) algorithm for any Graph. It has
much worse efficiency compared to other algorithms like Dijkstra's algorithm.
However, it can present correct results even with graphs that contain negative
cycles.

> [!Note] 
> This algorithm can also be used for detecting negative cycles and determining
where they are.

## Intuition

The algorithm works by repeatedly relaxing the edges of the graph. Relaxation
involves updating the shortest path estimates of the vertices. The process is
repeated for a total of |V| - 1 times, where |V| is the number of vertices in
the graph. If any vertex can still be relaxed after |V| - 1 iterations, a
negative cycle exists.

## Questions and Answers

**Q**: How does the Bellman-Ford algorithm handle negative weights?
**A**: The Bellman-Ford algorithm can handle negative weights by allowing the shortest path to be updated in the presence of negative edges.

**Q**: What is the time complexity of the Bellman-Ford algorithm?
**A**: The time complexity of the Bellman-Ford algorithm is $O(V \cdot E)$, where $V$ is the number of vertices and $E$ is the number of edges in the graph.

**Q**: When should I use the Bellman-Ford algorithm over Dijkstra's algorithm?
**A**: Use the Bellman-Ford algorithm when the graph contains negative weight edges. Dijkstra's algorithm does not work correctly in such scenarios.
