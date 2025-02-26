---
title: "Edge List"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

[Graph representation](Graph%20representation.md)

An edge list is a way to represent a graph simply as an unordered list of edges. Assume the notation for any triplet (u,v,w) means "cost from node u to node v is w"

This is not used often due to it's lack of structure. However, it is conceptually simple and practical in handful of algorithms. 

|Pros|Cons|
|:-:|:-:|
|Space efficient for representing sparse graphs|Less space efficient for denser graphs.|
|Iterating over all edges is efficient|Edge weight lookup is $O(E)$|
||Very simple graph representation|
