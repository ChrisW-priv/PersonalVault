---
title: Constant Function
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

> [!Definition]
> Function that always returns the same value. Part of [Function programming](Function%20programming) theory.

## Code

```js
function constant(v){
	return function value(){ 
		return v;
	}
}
```

## Example

This code is very useful when we have an API that only accepts functions even if those functions only return a value. For example in JavaScript we have `then` such that:

```js
// will not work
p1.then(foo).then( p2 ).then(bar);

// instead
p1.then(foo).then( () => p2 ).then(bar);
```

however, having a constant function:

```js
p1.then(foo).then( constant(p2) ).then(bar);
```
