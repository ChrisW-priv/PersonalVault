---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Function pointer
---

Function pointers in C and C++ have following structure 

`return_type (*fn_pointer_name) (argument_type, ...)`

## C++ Example

```c++
#include <iostream>
using namespace std;

int multiply(int a, int b) {
	return a * b;
}

int main() {
	// declare function pointer called func 
	int (*func) (int, int);
	// assign pointer to `multiply` function 
	func = multiply;
	int result = func(15, 2);
	cout << result << endl;	
}
```