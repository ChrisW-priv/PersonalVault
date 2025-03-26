---
title: "Polynomial vs Non-Polynomial time complexity"
description: ""
date: "2025-03-26"
tags: 
categories:
  - zettelkasten
---

**Q:** What is polynomial time?
**A:** Polynomial time is when the [Big O notation](Big%20O%20notation.md) time
complexity of algorithm can be expressed as $O(n^k)$, where $n$ is the size of
the input and $k$ is a constant. The time required increases at a manageable
rate.

**Q:** What are the examples of NP time complexities
**A:**
Exponential time (like $O(2^n)$) grows much faster. Every extra step doubles the work!
Factorial time (like $O(n!)$) is even worse — the work multiplies by every number before it, and it gets huge very quickly.

**Q:** Why is polynomial time important?
**A:** If an algorithm runs in polynomial time, it’s efficient enough to handle
larger inputs. Exponential and factorial time are practically unusable for large
inputs because the time grows too quickly.