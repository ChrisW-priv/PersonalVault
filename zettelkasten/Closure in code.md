---
title: "Closure in code"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

[Closure Properties of Regular Languages](zettelkasten/Closure%20Properties%20of%20Regular%20Languages.md)

> [!Definition]
> Record storing a function together with an environment. In practice, closure is an option to reference variables from outside the scope of function. 

Closure is actually really closely related to [Object oriented programming](Object%20oriented%20programming), and in languages that do not support oop, is used as a supplement for it.

## Code
Let's create a function that implements memoisation to some unary function:
```python
def memoize(unaryFn):
	memo = {}
	def memoisedFn(x):
		if x in memo:
			return memo[x]
		result = unaryFn(x)
		memo[x] = result
		return result
	return memoisedFn
```
This code starts by initialising the `memo` dictionary and returning function handle to a function that wraps `unaryFn` execution with some checks to `memo` dictionary from outside scope.