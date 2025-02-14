---
title: "Counting the number of in and out edges in a graph"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

## Definition
To know the degree of each edge can be really useful when trying to find [Eulerian Path](Eulerian%20Path.md) of even [Eulerian cycle](Eulerian%20cycle.md). This is very easily done in linear time for [Undirected Graph](Undirected%20Graph.md) however can be quite hard to be done efficiently for [Directed Graph](Directed%20Graph.md). Code below is a suggestion on how to do it quickly.

## Code
```pseudo
function countInOutEdges(graph, N):
	in_deg = [0,0,...,0] # size N
	out_deg = [0,0,...,0] # size N

	for (i=0;i<N;i++):
		neighbours = graph[i]
		out_deg[i] = len(neighbours)
		for neighbour in neighbours:
			in_deg[neighbour]++	
	return in_deg, out_deg
```

## Intuition
In this solution no work is done unnecessarily so it's best solution so far.