---
title: Implicit differentiation
description: No description provided.
date: 2025-02-14
tags:
  - math
  - calculus
categories:
  - null
  - zettelkasten
---

[Derivative](Derivative.md)

## Implicit differentiation

For some equations we can't write "simple" derivative equations with $\frac{dy}{dx}$. For example $x^2 + y^2 = 5^2$ describes a circle. We can however take steps that will make sense and will result in $\frac{dy}{dx}$. Those steps are:

1. Differentiate both sides with respect to both $x$ and $y$

$$\frac{d(x^2 + y^2)}{dx} + \frac{d(x^2 + y^2)}{dy} = 0$$

2. Extract both derivatives

$$2x\cdot dx + 2y\cdot dy = 0$$

3. Rearrange terms

$$\frac{dy}{dx} = -\frac{x}{y}$$

Note: this technique is very similar to the differentiation of multi-variable functions. in the example above the function output is constant but it doesn't have to be.
