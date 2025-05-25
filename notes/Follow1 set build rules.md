---
title: Follow1 set build rules
description: ""
date: 2025-05-25
tags:
  - ECOTE
categories:
  - zettelkasten
draft: false
---

[ECOTE-5-EN-mod](../projects/ECOTE/ECOTE-5-EN-mod.pdf)

$\text{Follow}_1(A)$

The set of terminals (a) that can appear immediately to the right of A in some
sentential form, that is, $S =>* \alpha Aa \beta$ for some $\alpha$ and $\beta$.
If $A$ can be the rightmost symbol in some sentential form,
then $\epsilon \in \text{Follow}_1 (A)$

## Compute $\text{Follow}_1(A)$

for all nonterminals A, apply the following rules until nothing can be added to
any Follow set: 

1. $\epsilon \in \text{Follow}_1(S)$, where S is the start symbol 
2. if there is a production $A\rightarrow\alpha B\beta$, then $\text{Follow}_1(B) = \text{First}_1(\beta) - \epsilon$
    Note that $\epsilon$ may still wind up in $\text{Follow}_1(B)$ by rule 3.
3. if there is a production $A\rightarrow\alpha B$, or a production $A\rightarrow\alpha B\beta$ where $\epsilon\in\text{First}_1(\beta)$, then $\text{Follow}_1(A) = \text{Follow}_1(B)$
