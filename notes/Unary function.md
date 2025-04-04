---
title: Unary function
description: Function accepting exactly one argument.
date: 2025-02-14
tags: 
categories:
  - zettelkasten
---

Part of [Function programming](Function%20programming) theory 

## Code

In JavaScript we may do a simple adapter for any function to accept only a single argument.

```js
function unary(fn){
	return function onlyOneArg(arg){
		return fn(arg);
	}
}
```

This way, is function `fn` accepts only one argument. This is useful to ensure that when we pass it to another function it truly is only unary function.

## Example

It is common to explain a usefulness of unary adapter with tool like [Map Pattern](Map%20Pattern.md). Say we have a function `parseInt` that accepts `value` that is string representation of an int and `radix` that is the system that number has been coded as.

**Map** commonly provides not just value but also index and array reference if it detects that function accepts more than one argument. Thus, in code below:

```js
["1", "2", "3"].map(parseInt);
// [1, NaN, NaN]
```

this is most likely not what we want. Probably we wanted to parse ints assuming they are encoded in decimal. Instead, `radix` was substituted with `index`. To fix this we can do:

```js
["1", "2", "3"].map(unary(parseInt));
// [1,2,3]
```
