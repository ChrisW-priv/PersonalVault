---
title: Pure function
description: Function that has no side-effects
date: 2025-02-14
tags: 
categories:
  - zettelkasten
---

## Intuition

Pure function is a perfect function in terms of 
[Function programming](Function%20programming) as it has no side-effects.

Using this improves [Code quality](Code%20quality).

Every such function is [idempotent](Idempotence.md) in programming sense but not
all are idempotent in pure mathematical way (although there may be many examples
including `unary` function pattern).

> [!Important]
> In many cases pure functions can be optimised by memorising the result of
computation via [Memoization](Memoization.md) or [Tabulation](Tabulation.md), or even [Pre-Computing](Pre-Computing)
Since $x$ always results in $y$ we can think of it as a simple map function. Be
careful not no memorise calls to cheap functions as memory lookup can be more
expensive than maths operations for example.
