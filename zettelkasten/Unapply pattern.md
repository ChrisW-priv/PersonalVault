---
title: "Unapply pattern"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

# Unapply pattern
> [!Definition]
> Pattern that gathers the arguments into a list of arguments for a function. Part of a [Function programming](Function%20programming) theory.

## Code
```js
function unapply(fn){
	return function unapplyFn(...args){
		return fn( args );
	};
}
```

## Example
Sometimes we have functions that we cannot alter but need to use in drastically different form:
```js
function foo([x,y]){
	return x + y;
}

[1,2,3,4,5].reduce( unapply(foo) ) // 15
```
Error is caused by to few arguments, `arr` is passed as `x` and `y` is empty.
Probably, we wanted `x` to be 3 and `y` to be 9. Therefore we program:
```js
bar(apply(foo)) // 12
```
