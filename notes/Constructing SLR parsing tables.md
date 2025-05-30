---
title: Constructing SLR parsing tables
description: ""
date: 2025-05-26
tags:
  - ECOTE
categories:
  - zettelkasten
draft: false
---

[LR grammar](LR%20grammar.md)
[Canonical Collection of LR(0) items](Canonical%20Collection%20of%20LR(0)%20items.md)

Let:
- $C = \{ I_0, I_1, \dots, I_n \}$ be the canonical collection of sets of LR(0) items for the augmented grammar $G'$.
- The states of the parser are $0, 1, \dots, n$, where state $i$ is constructed from $I_i$.

### Parsing Actions

1. If $[A \rightarrow \alpha \cdot a \beta]$ is in $I_i$ and $\text{goto}(I_i, a) = I_j$ for terminal $a$,  
   then set $\text{ACTION}[i, a] := \text{shift } j$.
2. If $[A \rightarrow \alpha \cdot]$ is in $I_i$,  
   then for all $a \in \text{FOLLOW}(A)$, set $\text{ACTION}[i, a] := \text{reduce } A \rightarrow \alpha$.
3. If $[S' \rightarrow S \cdot]$ is in $I_i$,  
   then set $\text{ACTION}[i, \$] := \text{accept}$.

### GOTO Transitions

1. If $\text{goto}(I_i, A) = I_j$, then set $\text{GOTO}[i, A] := j$ for non-terminal $A$.
