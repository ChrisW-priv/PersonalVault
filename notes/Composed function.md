---
title: Composed function
description: Function created from combining output from one function as the input to another function
date: 2025-02-14
tags: 
categories:
  - zettelkasten
---

[Function in Mathematics](Function%20in%20Mathematics.md)

## Notation

Given function `f` and a function `g`, we define composed function `h`:

$$h = f(g(x))$$

We often use separate composition operator instead:

$$h = f(g(x)) = (f \circ g)(x)$$

## Intuition

It can often be much easier to create couple of small functions to solve a
problem instead of creating solution all in one go. This pattern is commonly
used in function programming. See [Compose pattern](Compose%20pattern.md) for
better perspective

## Derivative

See [Chain rule](Chain%20rule.md).
