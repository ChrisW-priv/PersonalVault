---
title: Longest path on DAG
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

Similarly as in [Single Source Shortest Path on DAG (SSSP)](Single%20Source%20Shortest%20Path%20on%20DAG%20(SSSP).md) this problem can be solved in $O(V+E)$ complexity.

Trick here is to multiply all edge values by -1, then find the SSSP and then multiply the edge values by -1 again.
