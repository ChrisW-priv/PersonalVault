---
title: "Pure function"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

# Pure function
> [!Definition]
> Function with no side-effects. 

## Intuition
Pure function is a perfect function in terms of [Function programming](Function%20programming) as it has no side-effects. 
Every such function is [idempotent](Idempotence.md) in programming sense but not all are idempotent in pure mathematical way (although there may be many examples including `unary` function pattern).

> [!Note]
> In many cases pure functions can be optimised by memorising the result of computation via [Memoization](Memoization.md) or [Tabulation](Tabulation.md). Since $x$ always results in $y$ we can think of it as a simple map function. Be careful not no memorise calls to cheap functions as memory lookup can be more expensive than maths operations for example.
