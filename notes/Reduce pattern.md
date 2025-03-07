---
title: "Reduce pattern"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

> [!Definition]
> A "Swiss knife" of [Function programming](Function%20programming). Executes a function for every element of an [Array](Array) and returns accumulated result. Result can be of any type, but commonly is an int or a list. It can also represent a struct that in turn represents state.

Reduce function accepts a function, an array and starting value. If starting value is not provided, it assumes `arr[0]` to be a start and `arr[1:]` to be the array to execute given function.

Thus, a signature for it will be `reduce(callback, initial_value, array) -> accumulated_result`

Every function that is used in this pattern must have signature equivalent to `foo(accumulated, next_value) -> new_result` and the final result will be the last `new_result` returned by the function. 
