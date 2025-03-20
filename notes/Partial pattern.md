---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Partial pattern
---

> [!Definition]
> Pattern that allows us to supply fewer arguments then necessary to the function. Part of a [Function programming](Function%20programming) theory.

## Code

```js
function partial(fn, ...presentArgs){
	return function partialFn(...laterArr){
		return fn( ...laterArr );
	};
}
```

## Example

Partial application is very useful in many situations. In general we will use it most often when we get some arguments now and some later. Then instead of passing arguments deeper into function stack calls, we create a partial function to be executed when rest of arguments are supplied.