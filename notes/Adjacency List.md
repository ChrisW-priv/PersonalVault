---
title: Adjacency List
description: An adjacency list is a way to represent a graph as a map from nodes to
date: 2025-02-14
tags:
  - null
categories:
  - zettelkasten
---

## What is an Adjacency List?

An adjacency list is a method for representing graphs where each node (or vertex) is associated with a list of edges (or connections) that it has with other nodes. 

## Pros and Cons

| Pros                                                | Cons                                              |
|----------------------------------------------------|---------------------------------------------------|
| Space efficient for representing sparse graphs      | Less space efficient for denser graphs           |
| Iterating over all edges is efficient               | Edge weight lookup is $O(E)$                      |
|                                                    | Slightly more complex graph representation        |

## Question and Answer

**Q: What is an adjacency list used for?**  
A: It is used to represent graphs, particularly when dealing with sparse graphs.

**Q: What are the advantages of using an adjacency list?**  
A: The main advantages include space efficiency for sparse graphs and efficient iteration over edges.

**Q: What are the disadvantages of using an adjacency list?**  
A: The disadvantages include less space efficiency for denser graphs, longer edge weight lookup times, and increased complexity.
