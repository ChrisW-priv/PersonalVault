---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Topological Sort
---

Topological sort (or top sort for short) is an algorithm that work on [Directed Acyclic Graphs (DAG)](Directed%20Acyclic%20Graphs%20(DAG).md). It creates something called [Topological ordering](Topological%20ordering.md).

Topological sort works with $O(V+E)$ complexity.

> [!Warning]
> Remember that this works ONLY for DAG. Any graph with cycles in it will not work!

## Algorithm

1. Pick an unvisided node
2. Beginning with the selected node, do a [Depth First Search (DFS)](Depth%20First%20Search%20(DFS).md) exploring only unvisited nodes.
3. On recursive callback of the DFS, add the current node to the topological ordering in the reverse order. (Or add to array and remember to revese it after the end of algorithm)

## Code

### Naive

```pseudo
n = number of nodes in the graph
graph = adjancy list representing graph
visited = [false, ..., false] # size n

function topsort():
	ordering = [0,...,0] # Length N
	i = N-1 # Index for ordering array

	for (at=0; at<N; at++):
		if V[at] == false:
			visited_nodes = []
			dfs(at, visitedNodes)
			for nodeId in visited_nodes:
				ordering[i] = nodeId
				i = i-1
	return ordering


function dfs(at, visitedNodes):

	V[at] = true
	edges = graph.getEdgesOutFromNode(at)
	for edge in edges:
		if v[edge.to] == false:
			dfs(edge.to, visitedNodes)
	
	visitedNodes.add(at)
```

### Optimised

Optimisation will focus on eliminating the creation and use of `visited_nodes` array as it serves no function other that to make things easier. We will rewrite the code to modify `ordering` array directly.

```pseudo
n = number of nodes in the graph
graph = adjancy list representing graph
visited = [false, ..., false] # size n

function topsort():
	ordering = [0,...,0] # Length N
	i = N-1 # Index for ordering array

	for (at=0; at<N; at++):
		if V[at] == false:
			i = dfs(at, i, ordering)

function dfs(at, i, ordering):
	V[at] = true
	edges = graph.getEdgesOutFromNode(at)
	for edge in edges:
		if V[edge.to] == false:
			i = dfs(edge.to, i, ordering)

	ordering[i] = at
	return i-1
```
