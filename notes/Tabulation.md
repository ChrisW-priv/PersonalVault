---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Tabulation
---

Similar to [Memoization](Memoization.md) as it is also saving the result of the function, this time in a table. This time you try to work "bottom-up". 

## Example

fill array of "x\*2" starting at 0: array = {0,2,4,6,8,...} can be computed as fn(x) = fn(x-1) + 2.