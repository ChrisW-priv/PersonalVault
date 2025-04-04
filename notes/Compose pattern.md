---
title: Compose pattern
description: Process of creating big functions from small ones to solve more complex tasks
date: 2025-02-14
tags: 
categories:
  - zettelkasten
---

Similar to [Pipe pattern](Pipe%20pattern.md), main difference is in function order passing.

Similar to [Composed function](Composed%20function.md) in mathematics

## Code

```js
function compose2(fn2, fn1){
	return function composed(origValue){
		return fn2(fn1(origValue));
	}
}
```

> [!Notice]
> As in mathematical version of compose pattern, we first execute function on the right and only then the one on the left. Thus `fn2` is executed after `fn1`.

General implementation for any number of functions:

```js
function compose(...fns){
	return function composed(result){
		var listFn = [...fns];
		while(listFn.length > 0){
			nextFn = listFn.pop();
			result = nextFn(result);
		}
		return result;
	}
}
```
