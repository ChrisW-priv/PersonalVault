---
title: Game State Transpositions
description: A repeated game state in a search tree, which can occur due to equivalence of boards due to symmetry, or different move sequences leading to the same position
date: 2025-03-26
tags:
  - minimax
categories:
  - zettelkasten
---

Reduces search space, saving time and memory.  

## Applications:

- [Minimax Algorithm](Minimax%20Algorithm.md)

## Key Concepts

### Transposition Table

A table that stores previously evaluated positions. 
In case of games that exhibit symmetry: hash-map of hash to board Id. Then it is
important to have a function that can dynamically generate all of the
transpositions from the hash.

Zobrist Hashing: Efficiently represents board states with unique hashes.  
