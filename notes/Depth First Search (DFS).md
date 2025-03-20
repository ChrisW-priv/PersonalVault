---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Depth First Search (DFS)
---

The DFS is the most fundamental search algorithm used to explore nodes and edges of a [Graph](Graph.md). It runs with time complexity of $O(V+E)$ and is often used as a building block in other algorithms. 

By itself DFS isn't that useful, but when augmented to perform other tasks such as count connected components, determine connectivity or find bridges/articulation points then DFS really shines.

To code DFS you can either use recursion (it's always depth first) or use [Stack](Stack.md) to build iterative solution

As name suggests a DFS plunges into a graph without regard for which edge it takes next until it cannot go further at which point it backtracks and continues.

We backtrack either when there are no out-coming edges or if the neighboring node has already been visited.

## Code

In general you will most often use recursion for DFS because although not as efficient it is much easier to read and therefore maintain.

```pseudo
n = number of nodes in the graph
graph = adjancy list representing graph
visited = [false, ..., false] # size n

function dfs(at):
	if visited[at]: return
	visited[at] = true

	neighbours = graph[at]
	for next in neighbours:
		dfs(next)

start_node = 0
dfs(start_node)
```
