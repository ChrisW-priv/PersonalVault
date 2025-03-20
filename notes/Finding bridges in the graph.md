---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Finding bridges in the graph
---

## Desription

Algorithm used for finding [Bridges](Bridges.md) in a [Graph](Graph.md).

## Code

```pseudo
id = 0
g = graph (as adjency list)
n = size of the graph

ids = [0,0,...,0] # len = n
low = [0,0,...,0] # len = n
visited = [false, false,...,false] # len = n

function findBridges():
	bridges = []
	for (i=0;i<n;++i):
		if (!visited[i]):
			dfs(i, -1, bridges)
	return bridges

function dfs(at, parent, bridges):
	visited[at] = true
	id+=1
	low[at] = ids[at] = id

	for (to: g[at]):
		if to == parrent: continue
		if (!visited[to]):
			dfs(to, at, bridges)
			low[at] = min(low[at], low[to])
			if (ids[at] < low[to]):
				bridges.add(at)
				bridges.add(to)
		else:
			low[at] = min(low[at], ids[to])
```

Note: this algorithm already does two steps in one go! Therefore it's complexity is $O(V+E)$
