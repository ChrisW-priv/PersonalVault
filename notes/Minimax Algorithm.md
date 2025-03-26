---
title: Minimax Algorithm
description: A decision-making strategy used in game theory.
date: 2025-03-26
tags:
  - minimax
categories:
  - zettelkasten
---

This algorithm is primarily used to evaluate state of games that are:

- two-player
- zero-sum
- turn based

## How It Works:

1. Tree Expansion: The game state is represented as a tree where each node represents a possible move.
2. Min and Max Players:
    - Maximizing Player (Max): Tries to get the highest possible score.
    - Minimizing Player (Min): Tries to reduce Max's score (opponent).
3. Recursive Evaluation: The algorithm explores all possible future moves up to a certain depth.
4. Backpropagation: The best score is propagated back up the tree, selecting the move that leads to the optimal outcome for the current player.

## Optimizations

The space of possible solutions gets overwhelming really quickly. In the most naive case the complexity is $O(b^d)$ (where $b$ is the branching factor and $d$ is the depth).

The optimizations will attack both of these factors:

- Reduce the number of branches we evaluate
- Reduce the depth of the search

But also we can try to reuse computation.
