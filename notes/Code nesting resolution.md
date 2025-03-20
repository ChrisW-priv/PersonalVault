---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Code nesting resolution
---

Part of [Code quality](Code%20quality)

Code nesting is adding more blocks or depth to your code. for example following code has 4 nested blocks:

```c
int calculate(int bottom, int top){
	if (top > bottom){
		int sum = 0;
		for (int n = bottom; n <= top; ++n){
			if (n % 2 == 0){
				sum += n;
			}
		}
		return sum;
	}
	else return 0;
}
```

## Methods to De-nest

### Extraction

Taking out a portion of a function into it's own separate function.

### Inversion

Switching the order of if return logic in favour of return-guarding statements.

## Reworking the example

### Step 1:

extract filtering part:

```c
int filterNumber(int number){
	if (number % 2 == 0) return number;
	return 0;
}

int calculate(int bottom, int top){
	if (top > bottom){
		int sum = 0;
		for (int n = bottom; n <= top; ++n){
			sum += filterNumber(n);
		}
		return sum;
	}
	else return 0;
}
```

### Step 2:

invert if return:

```c
int filterNumber(int number){
	if (number % 2 == 0) return number;
	return 0;
}

int calculate(int bottom, int top){
	if (top < bottom) return 0;
	int sum = 0;
	for (int n = bottom; n <= top; ++n){
		sum += filterNumber(n);
	}
	return sum;
}
```