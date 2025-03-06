---
title: "Finding Articulation points in the graph"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

## Desription

Algorithm used for finding [Articulation points](Articulation%20points.md) in a [Graph](Graph.md).

Note: here we will use the idea of cycles!

## Code

```pseudo
id = 0
g = graph (as adjency list)
n = size of the graph
outEdgeCount

ids = [0,0,...,0] # len = n
low = [0,0,...,0] # len = n
visited = [false, false,...,false] # len = n
isArt = [false, false,...,false] # len = n

function findBridges():
	bridges = []
	for (i=0;i<n;++i):
		if (!visited[i]):
			outEdgeCount = 0
			dfs(i, i, -1)
			isArt[i] = outEdgeCount > 1
	return bridges

function dfs(at, parent, bridges):
	if (parent == root): outEdgeCount++
	visited[at] = true
	id+=1
	low[at] = ids[at] = id

	for (to: g[at]):
		if to == parrent: continue
		if (!visited[to]):
			dfs(to, at, bridges)
			low[at] = min(low[at], low[to])
			if (ids[at] <= low[to]):
				isArt[at] = true
		else:
			low[at] = min(low[at], ids[to])
```

Note: this algorithm already does two steps in one go! Therefore it's complexity is $O(V+E)$
