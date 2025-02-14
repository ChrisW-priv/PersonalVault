---
title: "Composed function"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

# Composed function
> [!Definition]
> Function that end result is based on an input from an output of another function. For example `f(g(x))` is evaluated as `x -g(x)-> y -f(y)-> result`

[Function in Mathematics](Function%20in%20Mathematics.md)
## Notation
Given function `f` and a function `g`, we define composed function `h`:
$$h = f(g(x))$$
We often use separate composition operator instead:
$$h = f(g(x)) = (f \circ g)(x)$$
## Intuition
It can often be much easier to create couple of small functions to solve a problem instead of creating solution all in one go. This pattern is commonly used in function programming. See [Compose pattern](Compose%20pattern.md) for better perspective

## Derivative
See [Chain rule](Chain%20rule.md).