---
title: Map Pattern
description: Pattern of computation that applies a function to every element of a given list to create a new list
date: 2025-02-14
tags: 
categories:
  - zettelkasten
---

> [!Important]
> Map pattern allows for parallel function execution. It is commonly used with
other [Function programming](Function%20programming) patterns

Standard signature for map definition is `map(fn, arr)`.

## Example in python:

```python
arr = list(range(10))
def double(x): return x*2
doubled = map(double, arr)
print(list(doubled)) # [0,2,4,...,18]
```

Notice that in python we need to convert it to list as by default `map` returns iterator.
