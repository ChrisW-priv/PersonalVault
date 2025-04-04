---
title: Idempotence
description: Property of a function where multiple calls to a function are not changing the result of initial one.
date: 2025-02-14
tags: 
categories:
  - zettelkasten
---

Property of [Function in Mathematics](Function%20in%20Mathematics.md) and Computer Science

## Notation

Given a function $f$, and $x$ as a member of set $s$.
Function f is idempotent if

$$f(f(x)) = f(x), \ \forall x \in S $$

## Intuition

In computer science we prefer to loosen the definition to "function $f$ returns
same results after first call to $f$"
