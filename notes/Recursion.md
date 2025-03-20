---
title: Recursion
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

## Definition

Recursion occurs when some function calls itself 

## Notation

For a given function $F$ we say that $F$ is recursive when it calls itself like so: 

$$F(x) = F(x-1)*x$$

Note: in case specified above there is no base case. This means that the function will never stop the calls, will never finish

If you wanted to implement a factorial function then you need to add a conditional statement like so

$$
F(x) = 1 \text{, if x is equal to 1 or 0 else F(x-1)*x}
$$

This way we cut the calls to the function and give us proper anwser (for arguments that are integers)

We can also visualise the process with [Stack](Stack.md) and 

## Intuition

Recursion can ALLWAYS be rewritten with an iterative implementation while using some sort of [Stack](Stack.md) that holds some data. 

Sometimes, it's ok only for arguments to be pushed to the stack but sometimes entire callstack need to be implemented.
