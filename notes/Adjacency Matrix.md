---
categories:
- zettelkasten
date: 2025-02-14
description: An adjacency matrix is a simple way to represent a graph using a square
  matrix.
tags: []
title: Adjacency Matrix
---

## What is an Adjacency Matrix?

An adjacency matrix, denoted as $m$, is a square matrix used to represent a graph. The elements of the matrix indicate whether pairs of vertices are adjacent or not in the graph. Specifically, the cell $m[i][j]$ represents the edge weight of going from node $i$ to node $j$.

## Q&A Structure

**Q: What is the purpose of an adjacency matrix?**  
A: It provides a straightforward way to represent the relationships between nodes in a graph.

**Q: How is the adjacency matrix structured?**  
A: The matrix has dimensions of $V \times V$, where $V$ is the number of vertices in the graph.

**Q: What does the value in the matrix represent?**  
A: The value $m[i][j]$ indicates the weight of the edge from node $i$ to node $j$. If there is no edge, it may be represented by a special value, often zero or infinity.

## Pros and Cons

| Pros                                                | Cons                                   |
|-----------------------------------------------------|----------------------------------------|
| Space efficient for representing dense graphs      | Requires $O(V^2)$ space               |
| Edge weight lookup is $O(1)$                       | Iterating over all edges takes $O(V^2)$ time |
| Simplest graph representation                       |                                        |
