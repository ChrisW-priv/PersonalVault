---
title: "Vector Norm"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

For different purposes there are several "norms" of a vector that we care about. 

In general the norm of the vector is a distance from the origin calculated in some way. 

Those are called in order:

- $L^{1}$ norm
- $L^{2}$ norm
- Max norm

## Notation

For a vector $v$ we note it's norm with $||v||$ and information of which norm we calculate in a subscript.

- For $L^1$: $||v||_1$
- For $L^2$: $||v||_2$
- For $L^\infty$: $||v||_\infty$
If no subscript is used, we assume $L^2$ norm.

## $L^1$ Norm

a.k.a Manhattan norm

This norm calculates the sum of absolute values of the components of the vector.

This is often used in mazes that follow the grid as distance between points is the distance across all directions.

For vector $[1,2,-3]$, it's $L^1$ norm is calculated like so: $result = 1+2+3=6$ 

## $L^{2}$ Norm

a.k.a Euclidean distance

This is a square root of sum of squared components.

This is the most straightforward way of calculating distance and usually what one thinks about when talking about distance.

For vector $[1,2,-3]$, it's $L^1$ norm is calculated like so: $result = \sqrt{1+4+9}=\sqrt{14}$ 

## $L^\infty$ Norm

a.k.a max function

Result of finding maximum absolute component of the vector.

For vector $[1,2,-3]$, it's $L^\infty$ norm is calculated like so: $result = max(1,2,3)=3$ 
