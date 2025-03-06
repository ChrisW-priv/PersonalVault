---
title: "Steps to multiprocessing in Python"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

Say you have a code you want to run in parallel. To do that you can follow those steps:

## Step 1

Make code a function. This makes it good for any code as it separates the input and output of the algorithm.

## Step 2

Format your code to use [Map Pattern](Map%20Pattern.md). It may be specially useful to use [Partial pattern](Partial%20pattern.md) to turn functions from multi-parameter to [Unary function](Unary%20function.md). 

## Step 3

Use one of many functions of `multiprocessing` module to run code in parallel. In particular, focus on `map`, `imap` of `imap_unordered`.

## Example

```python
from multiprocessing import Pool
from functools import partial

def foo(x,y,z):
	# do what ever here 
	return x+y+z

def baz():
	x = 5
	y = 25
	zs = [1,2,3,4,5]
	unary = partial(foo, x, y)
	with Pool() as pool:
		results = pool.imap_unordered(unary, zs)
		for result in results:
			# whatever you do with result goes here
```
