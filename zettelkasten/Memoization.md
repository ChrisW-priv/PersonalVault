---
title: "Memoization"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

Optimisation technique that aims to speed up computer programs by storing the results of expensive function calls and returning those results when same input occurs.

Functions that use memoization have to be deterministic! This means that same input will always return same output.

## Example
```js
function slow_compute(x){
	// normally this function is really slow. 
	// here just multiplication for easy example
	return x*2
}

var CASHED_RESULTS = {};
function memoised_compute(x){
	if (x in CASHED_RESULTS){
		return CASHED_RESULTS[x];
	}

	const result = slow_compute(x);
	CASHED_RESULTS[x] = result;
	return result;
}
```