---
title: Curry pattern
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

> [!Definition]
> Creating new functions with subsequent calls providing more and more arguments. Part of [Function programming](Function%20programming) theory.

Instead of taking all arguments at once, or some number of arguments like in [Partial pattern](Partial%20pattern.md) we only pass a single argument in each function call.

## Code

```js
function curry (fn, arity = fn.length){
	return (function nextCurried(prevArgs) {
		var args = [...prevArgs, nextArg];
		if (args.length >= arity){
			return fn( ...args );
		}
		else {
			return nextCurried(args);
		}
	})([]);
}
```

In this code we collect arguments into a list and then we call function with those arguments spread when number of arguments is enough.
