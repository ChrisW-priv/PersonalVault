---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Identity Function
---

> [!Definition]
> Function accepting single argument and returning it as is. Part of [Function programming](Function%20programming) theory 

## Code

In JavaScript we note it as:

```js
function identity(v){
	return v;
}
```

## Example

This is so simple, but surprisingly useful. Say we want to filter an array to not contain an empty quotes. Using [Filter pattern](Filter%20pattern.md) we may do:

```js
["", "Now", "is", "the", "time", "!", "", ""].filter(identity)
// ["Now", "is", "the", "time", "!"]
```

Another very useful trait is using it as a default parameter for predicate function in formatting functions:

```js
function output(msg, formatFn = identity){
	msg = formatFn(msg);
	console.log(msg);
}
function upper(txt){
	return txt.toUpperCase();
}
const msg = "Hello World";
output(msg, upper); // HELLO WORLD
output(msg); // Hello World
```