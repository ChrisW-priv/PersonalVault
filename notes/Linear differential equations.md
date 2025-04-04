---
title: Linear differential equations
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

## Definition

Given a function:

$$
y' + P(x)y = Q(x)
$$

Step 1: Calculate an integrating factor

$$
I(x) = e^{\int P(x)dx}
$$

Step 2: calculate general solution

$$
y = \frac1{I(x)}\left[\int Q(x)I(x)dx\right]
$$
