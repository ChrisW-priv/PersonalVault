---
title: Alpha Beta Pruning
description: Alpha-Beta pruning is an optimization technique used in the Minimax Algorithm
date: 2025-03-26
tags:
  - minimax
categories:
  - zettelkasten
---

[Minimax Algorithm](Minimax%20Algorithm)

## Key Concepts

- Alpha ($\alpha$): The best value that the maximizing player (MAX) can guarantee so far.
- Beta ($\beta$): The best value that the minimizing player (MIN) can guarantee so far.

The pruning condition is:  

- If at any node, $\alpha\geq\beta$, further exploration of that node's children is stopped.

Imagine a tree where:

- MAX tries to maximize the score.
- MIN tries to minimize the score.
- The leaf nodes have some evaluation score.

Example:

```
      A         # MAX
   /     \
  B       C     # MIN
 / \     / \
C   D   E   F   # MAX
```

Root is called max as by convention: the player that maximizes the score goes first.

## Instruction on each step

1. Initialize:
    1. If it's a leaf node, assign a static eval and return it.
    2. Identify the node type (passed by param) (MIN | MAX)
    3. Initialize alpha and beta if needed:
        - $\alpha$ = -$\infty$, $\beta$ = +$\infty$
2. If is terminal node -> return evaluation
3. For each child node:
    - Visit the child recursively (DFS) -> Retrieve its evaluated value and store in `last`
    - Update $\alpha$ or $\beta$ based on the node type:
        - If MAX: $\alpha = \max(\alpha, last)$
        - If MIN: $\beta = \min(\beta, last)$
    - If $\alpha\geq\beta$, prune remaining children
        - Stop exploring further siblings.
        - Return the `last` value immediately to the parent.
    - If all children are evaluated (no prune), return:
        - MAX node: return local max
        - MIN node: return local min

## Intuition

Let's focus on this specific case. Here we have a binary tree that has root `A`
that we need to find value of and node `B` that was already evaluated to 7.

```
      A(?)               MAX
    /      \   
B(7)        C(?)         MIN
          /      \ 
      D(5)        E(?)   MAX
```

### Step-by-Step Evaluation

1. Eval A (MAX)
    - $\alpha$ = -$\infty$, $\beta$ = +$\infty$  
    - Move to B
2. Eval B (Leaf Node)
    - B already has a value of 7, so we return to A
3. Eval A (MAX)
    - updates $\alpha$ = max(-$\infty$, 7) = 7
    - Decide if the $\alpha\geq\beta$ -> NO; Since $\alpha$ ≥ $\beta$ ($7 \ngeq +\infty$), we move to C
4. Eval C (MIN)
    - $\alpha = 7$, $\beta = +\infty$
    - Decide if the $\alpha\geq\beta$ -> NO; Since $\alpha$ ≥ $\beta$ ($7 \ngeq +\infty$), we move to D
5. Evaluate D (Leaf Node)
    - D already has a value of 5, so we return to C
6. Evaluate C (MIN) 
    - Update the $\beta$ = min(+$\infty$, 5) = 5
    - Decide if the $\alpha\geq\beta$ -> YES ; Since $\alpha$ ≥ $\beta$ (7 ≥ 5), we return early
    - E is NOT evaluated because A will never choose C.

**Q:** why is E pruned?
**A:** 
This is the reason we stop early in the example case is that ANY move that is
$\geq 5$ will be ignored by the minimizing player and any thing lower will lead
to EVEN LOWER evaluation, so the maximizing player will DEFINATELY not use that
path

**Q:** what if D was 8?
**A:**
Then it could happen that the value of A is even larger. There are 2 cases for E:

- E is $< 8$, in which case it is better for MIN, thus we wasted compute (if we ordered tree better it would not happen)
- E is $\geq 8$, in which case the best move for MIN is still 8, thus the position is even better for A

### Conclusion

> [!Important]
> This is the reason we stop early in the example case is that ANY move that is
$\geq 5$ will be ignored by the minimizing player and any thing lower will lead
to EVEN LOWER evaluation, so the maximizing player will DEFINATELY not use that
path
