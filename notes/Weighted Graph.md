---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Weighted Graph
---

[Graph](Graph.md)

## Representation

This relation can be related with triplet (u,v,w)

## Intuition

Edges of the graphs contain a certain weight to represent an arbitrary value such as cost, distance, quantity etc.

> [!Notice]
> Weighted Graph is "just" an optimisation of unweighted graph.

If you consider:

```mermaid
flowchart LR
    A(( )) --> B(( )) --> C(( ))
```

It is the same as 

```mermaid
flowchart LR
    A(( )) -->|2| C(( ))
```
