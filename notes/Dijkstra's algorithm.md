---
title: "Dijkstra's algorithm"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

## Definition

Dijkistra's algorithm is a solution to Single Source Shortest Path ([SSSP](SSSP)) for non-negative [Weighted Graph](Weighted%20Graph.md)

Typically the efficieny of this algorithm is $O(E+log(V))$ which is really competetive against other algorithms.

## Notation

## Intuition

Dijkitra's algorithm can ONLY be run on graph with no negative edge weights. This allows us to let the algorithm act in a gready manner
