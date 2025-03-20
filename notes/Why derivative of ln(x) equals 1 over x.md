---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Why derivative of ln(x) equals 1 over x
---

Steps to get a derivative of $ln(x)$:

1. write it as $y = ln(x)$
2. rewrite it as $e^y = x$ (using definition of a $log$)
3. using [Implicit differentiation](Implicit%20differentiation.md) property write $e^y\cdot dy = dx$ 
4. rearrange the terms and get $\frac{dy}{dx} = \frac{1}{e^y}$
5. and since $e^y = x \rightarrow \frac{dy}{dx} = \frac{1}{x}$