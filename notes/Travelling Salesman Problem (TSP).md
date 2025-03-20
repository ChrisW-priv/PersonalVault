---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Travelling Salesman Problem (TSP)
---

## Definition

TSP is a famous problem in Computer Science. It is very difficult to provide good algorithm for TSP for large scale.

## Problem:

`Given a list of cities and the distances between each pair of cities what is the shortest possible route that visits each city exactly once and returns to the origin city`

In other words:

Given a complete [Weighted Graph](Weighted%20Graph.md) what is the Hamiltonian cycle of minimum cost.

Note: there might be many optimal solutions with lowest cost!

## Solution

### $O(n!)$

Easiest (brute-force), solution is to simply calculate all [permutations](Permutation) of the route, calculate cost and select th fastest.

### $O(N^2\cdot 2^n)$

Using dynamic programming we can do slightly better than $O(n!)$. The idea is to compute best path for $N$ nodes by knowing the best path for $N-1$ nodes.

> [!Note]
> Although in actuality this solution is MUCH better than $O(n!)$ it's still unfeasible to try to solve larger graphs using this method. We can still find solutions for around to 23 nodes in reasonable time!

#### Computation

To compute the optimal solution for paths of length 3, we need to remember two things from each of the n=2 cases:

1) The set of visited nodes in the subpath
2) the index of the last visited node in the path
Together these two things form our dynamic programming state. There are $N$ possible nodes that we could have visited last and $2^n$ possible subsets of visited nodes. Therefore the space needed to store the answer to each sub-problem is bound by $O(N2^n)$.

#### Visited nodes as bit field

The best way to represent the set of visited nodes is to use a single 32 bit integer. We can do this for a simple reason we will not be able to compute anything larger than 32 nodes.

#### Code

```pseudo
function tsp(m,S):
	N = m.size
	memo = 2d table of size N by 2^n
	
	# setup:
	for (i=0;i<N;++i):
		if i==S: continue
		memo[i][1<<S|1<<i] = m[S][i]
	
	solve(m, memo, S, N)
	minCost = findMinCost(m, memo, S,N)
	tour = find OptimalTour(m, memo, S,N)
	return (minCost, tour)

function solve(m, memo, S,N):
	for (r=3;r<=N;r++):
	# The combinations function generates all bit sets of size N with r bits set to 1.
	for subset in combinations(r,N):
		if notIn(S, subset): continue
		for (next = 0;next<N;next++):
			if (next == S || notIn(next,subset): continue
			state ^= (1<<next)
			minDist = +infinity
			for (e=0;e<N;e++):
				if e==S || e == next || notIn(e,subset): continue
				newDistance = memo[e][state] + m[e][next]
				minDist = min(minDist, newDistance)

function notIn(i, subset):
	return ((1<<i) & subset) == 0

function findMinCost(m,memo,S,N):
	END_STATE = (1<<N)-1
	minTourCost = +infinity
	for (e=0; e<N; e++):
		if e==S: continue
		tourCost = memo[e][END_STATE] + m[e][S]
		minTourCost = min(minTourCost, tourCost)

	return minTourCost

function findOptimalTour(m, memo, S,N):
	lastIndex = S
	state = (1<<N)-1
	tour = array size N+1

	for (i=N-1; i >= 1;i--):
		index = -1
		for (j=0;j<N;j++):
			if j==S || notIn(j,state): continue
			if (index == -1) index = j
			prevDist = memo[index][state] + m[index][lastIndex]
			newDist = memo[j][state] + m[j[lastIndex]]
			if (newDist < prevDist) index = j

		tour[i] = index
		state ^= (1 << index)
		lastIndex = index

	tour[0] = tour[N] = S
	return tour
```

### Aproximations

Commonly insted of trying to get the perfect solutions problem is changed to `what route is good enough`? 

Then - very often we offload the giant computation to the GPU that will find very good (but probably not the best) solution in seconds.

Examples include ant colony simulation and others.
