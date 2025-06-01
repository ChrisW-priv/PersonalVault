---
title: LL1 grammar
description: ""
date: 2025-05-25
tags:
  - ECOTE
categories:
  - zettelkasten
draft: false
---

[Compiler Grammar](Compiler%20Grammar)

A grammar $G$ is **LL(1)** if and only if whenever  
$A \rightarrow \alpha \mid \beta$ are two distinct productions of $G$, the following conditions hold:

1. There is no terminal $a$ such that $\alpha$ and $\beta$ derive strings beginning with $a$.
2. At most **one** of $\alpha$ and $\beta$ can derive the empty string.

If $\beta \Rightarrow^* \epsilon$, then $\alpha$ must not derive any strings beginning with a terminal in $\text{Follow}_1(A)$.

[Some parsing table](Some%20parsing%20table.md)

### Example 1

Given the grammar:

$$
\begin{align}
S &\rightarrow AS' \\
S' &\rightarrow +AS' \mid \epsilon \\
A &\rightarrow BA' \\
A' &\rightarrow *BA' \mid \epsilon \\
B &\rightarrow (S) \mid a
\end{align}
$$

Analysis:
- $S$ – only one production → ✅ OK
- $S'$ – two productions derive different strings ($+, \epsilon$)  
  - only one production can derive $\epsilon$, and $+$ is not in Follow($S'$) → ✅ OK
- $A$ – only one production → ✅ OK
- $A'$ – two productions derive different strings ($*, \epsilon$)  
  - only one production derives $\epsilon$, and $*$ is not in Follow($A'$) → ✅ OK
- $B$ – two productions derive different strings ($(S), a$) → ✅ OK

**Conclusion:**  
✅ So it is an **LL(1) grammar**

