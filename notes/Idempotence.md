---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Idempotence
---

> [!Definition]
> Property of [Function in Mathematics](Function%20in%20Mathematics.md) and Computer Science that describes situation where multiple application is not changing result of initial one.

## Notation

Given a function $f$, and $x$ as a member of set $s$. Function f is idempotent if

$$f(f(x)) = f(x), \ \forall x \in S $$

## Intuition

In computer science we prefer to loosen the definition to "function $f$ returns same results after first call to $f$"