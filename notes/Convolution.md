---
categories:
- null
- zettelkasten
date: 2025-02-14
description: No description provided.
tags:
- math
title: Convolution
---

[Vector](Vector.md)

[Function in Mathematics](Function%20in%20Mathematics.md)

## Notation

Formally we denote result $r$ of convolving functions $g,h$ like so:

$$r(t) = (g*h)(t) = \int_{-\infty}^{\infty}g(x)\cdot h(t-x)dx$$

Where $\cdot$ is point-wise multiplication

## Intuition

We can imagine this as a function that first creates some mirror image of one of

the functions, then multiplies it point wise then shifts is to the right and

repeats the process infinitely many times. After that, it just sums all the

results we got. In practice we can will often just get the result for some

interval and in the limit to infinity we get some real number.