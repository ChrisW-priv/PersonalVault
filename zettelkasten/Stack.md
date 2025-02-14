---
title: "Stack"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

# Stack
## Definition
Stack is an insanely powerful [Data Structure](Data%20Structure). It operates on basis of LIFO meaning that element that was pushed last will be used first.

## Associated Functions
- push - add element to stack
- pop - remove element from stack
- top - get value of the top element (without removing it)
Note: methods "pop" and "top" can sometimes be merged together as "pop". It's important to read documentation to see if this is the case. When implementing Stack on our own it's quite a standard to make them separate.

## Intuition
Imagine stack as a drawer with documents. If you put some documents 'A,B,C,D' in the drawer you can only take them out in 'D->C->B->A' order.
