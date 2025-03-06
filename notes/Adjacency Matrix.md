---
title: "Adjacency Matrix"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

[Graph representation](Graph%20representation.md)

[Matrix](Matrix.md)

A adjacency matrix which we call m is a very simple way to represent a graph. The idea is that the cell $m[i][j]$ represents the edge weight of going from node i to j.

|Pros|Cons|
|:-:|:-:|
|Space efficient for representing dense graphs|Requires $O(V^2)$ space|
|Edge weight lookup is $O(1)$|Iterating over all edges takes $O(V^2$) time|
|Simplest graph representation||
