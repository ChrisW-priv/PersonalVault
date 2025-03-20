---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Filter pattern
---

> [!Definition]
> Pattern of excluding some values from an [Array](Array) given some condition. Common part of [Function programming](Function%20programming).

Often, implementation is to create new array given some predicate function.

Technically it is not needed but often it is. 

Value is passed on to the new array if predicate function evaluates to `true`.

Standard signature for filter function is `filter(predicateFn, arr)`

## Example in python:

```python
arr = list(range(10))
def is_even(x): return x % 2 == 0
even_numbers = filter(is_even, arr)
print(list(even_numbers)) # [0,2,4,6,8]
```

Notice that in python we need to convert it to list as by default `filter` returns iterator.