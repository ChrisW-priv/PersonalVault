---
title: Integrating factor for exact method
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

First steps are the same as in [Exact method for solving ODEs](Exact%20method%20for%20solving%20ODEs.md)

if $Q_x-P_y \neq 0$ then we have to calculate the **integrating factor** that will change our equation into form that will allow us to calculate the result with exact method.

This integrating factor is $\mu$ and we use it like this:

For a original function $f(x,y) := P(x,y) dx + Q(x,y) dy = 0$ 

we transform it into 

$f(x,y) := P(x,y)\mu dx + Q(x,y)\mu dy = 0$

This guaranties that $P(x,y)\mu_y, Q(x,y)\mu_x$ will be equal to each other.

Note: $P(x,y)\mu_y, Q(x,y)\mu_x$ will be later referred to as $\widetilde{P}, \widetilde{Q}$ as it makes it more compact

## Calculating $\mu$

For an original function $f(x,y):=P(x,y)dx+Q(x,y)dy = 0$

We want to transform it to $f(x,y):=P(x,y)\mu dx+Q(x,y)\mu dy = 0$

1. $$\frac{\mu'}{\mu} = \frac{P_y-Q_x}{Q}\text{ and dx in the integral}$$

or, if that is dependent on both x and y:

2. $$\frac{\mu'}{\mu} = \frac{Q_x-P_y}{P}\text{ and dy in the integral}$$

to get $\mu$ just integrate both side using $dx$ or $dy$ depending how u got $\frac{\mu'}{\mu}$. 

Once you calculated $\mu$ just multiply $P,Q$ and return to [Exact method for solving ODEs](Exact%20method%20for%20solving%20ODEs.md) with this new function.
