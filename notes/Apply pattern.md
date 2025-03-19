---
title: Apply pattern
date: 2025-02-14
description: This note explains the apply pattern in function programming, which allows for spreading arguments from an array into a function.
tags: 
  - function_programming
  - programing_pattern
categories: 
  - zettelkasten
---

> [!Definition]
> The apply pattern spreads the arguments from a list into separate arguments of a function. It is part of the [Function programming](Function%20programming) theory.

## QA

**Q: What is the apply pattern?**  
A: The apply pattern is a technique in function programming that allows an array of arguments to be passed to a function as individual arguments.

**Q: Why do we use the apply pattern?**  
A: We use the apply pattern when we have functions that we cannot alter but need to use in drastically different forms, allowing for the dynamic application of arguments.

## Code

```js
function apply(fn){
	return function applyFn(argsArr){
		return fn(...argsArr);
	};
}
```

## Example

Consider the following function:

```js
function foo(x, y){
	return x + y;
}
```

Now, we have a function `bar()` that is supposed to work with `foo()`, but we provide it an array of arguments rather than individual ones:

```js
function bar(fn){
	const arr = [3, 9];
	return fn(arr);
}

bar(foo) // error
```

The error occurs because too few arguments are passed; `arr` is interpreted as `x`, while `y` remains undefined.

To fix this, we can use the apply pattern as follows:

```js
bar(apply(foo)) // 12
```

Now, `3` is passed as `x`, and `9` is passed as `y`, resulting in the output `12`.