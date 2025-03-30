---
title: Max Flow on a graph
description: Answers a question of how much "flow" can we push through the network
date: 2025-02-14
tags: []
categories:
  - null
  - zettelkasten
---

## Notation

To have a Max Flow chart you need to have a [Graph](Graph.md) that has a Start (S) and Sink (T)

## Solution

To find the maximum flow (and min-cut as a by product), the Ford-Fulkerson

method repeatedly finds augmenting paths through the residual graph and augments

the flow until no more augmenting can be found. 

An augmenting path is a path of edges in the residual graph with unused capacity

greater that zero from the source $s$ to the sink $t$.

This method can be done in $O(fE)$ where f is the maximum flow. 

Alternatives:

![Pasted image 20221102235228](attachments/Pasted%20image%2020221102235228.png)

Note: here we use very pesimistic notation and in practice those algorithms will

be much faster which in turn make it very difficult to compare solely based on

complexities.

## Intuition

Imagine the graph as an abstract representation of a road network or water pipes.
