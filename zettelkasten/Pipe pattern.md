---
title: "Pipe pattern"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

> [!Definition]
> Pipe pattern is a way of creating a solution to a complex problem by using already defined, small functions and use their outputs as inputs for next functions.

Similar to [Compose pattern](Compose%20pattern.md). The order of arguments, however is reversed to get more natural left to right implementation

## Code
We can use [Reduce pattern](Reduce%20pattern.md) to create pipes:
```js
const pipe = (...fns) => (x) => fns.reduce((acc, fn) => fn(acc), x)
```
and use it like:
```js
const doubleInt = (x) => x*2;
const add2 = (x) => x + 2;
piped = pipe(add2, doubleInt);
piped(5) // result = (5 + 2) * 2
```
