---
title: "Apply pattern"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

+++
title = "Apply pattern"
type = "post"
tags = ["zettlekasten", "programming_pattern"]
categories = ["function programming", ]
+++


# Apply pattern
> [!Definition]
> Pattern that spreads the arguments from a list into separate arguments of a function. Part of a [Function programming](Function%20programming) theory.

## Code
```js
function apply(fn){
	return function applyFn(argsArr){
		return fn( ...argsArr );
	};
}
```

## Example
Sometimes we have functions that we cannot alter but need to use in drastically different form:
```js
function foo(x,y){
	return x + y;
}

function bar(fn){
	const arr = [3, 9];
	return fn(arr);
}

bar(foo) // error
```
Error is caused by to few arguments, `arr` is passed as `x` and `y` is empty.
Probably, we wanted `x` to be 3 and `y` to be 9. Therefore we program:
```js
bar(apply(foo)) // 12
```
