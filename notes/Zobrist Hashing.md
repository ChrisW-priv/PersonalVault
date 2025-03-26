---
title: Zobrist Hashing
description: Hashing technique used to efficiently generate a unique hash value for a given state in a system
date: 2025-03-26
tags:
  - minimax
categories:
  - zettelkasten
---

Note is focusing on a concrete application in context of a chess game, but of
course, this is easily generalizable to any game that we try to run 
[Minimax Algorithm](Minimax%20Algorithm.md) on.

## Key Properties

- Deterministic: The same state always has the same hash.
- Uniform Distribution: Reduces hash collisions.

## Initialization

At program initialization, we generate an array of pseudorandom numbers:

- One number for each piece at each square
- Four numbers to indicate the castling rights, though usually 16 (2^4) are used for speed
- Eight numbers to indicate the file of a valid En passant square, if any
- One number to indicate it is black to move

This leaves us with an array with 781 ($12*64 + 4 + 8 + 1$) random numbers. Since
pawns don't happen on first and eighth rank we could do $12*64 - 16$.
There are even proposals and implementations to use overlapping keys
from unaligned access up to an array of only 12 numbers for every piece and to
rotate that number by square (faster due to cache locality I guess).

Programs usually implement their own Pseudorandom number generator (PRNG), both
for better quality random numbers than standard library functions, and also for
reproducibility. This means that whatever platform the program is run on, it
will use the exact same set of Zobrist keys. This is also useful for things like
opening books, where the positions in the book can be stored by hash key and be
used portably across machines, considering endianness.

## Runtime

If we now want to get the Zobrist hash code of a certain position, we initialize
the hash key by xoring all random numbers linked to the given feature, e.g. the
initial position:

```
{Hash for White Rook on a1} xor
{Hash for White Knight on b1} xor
{Hash for White Bishop on c1} xor 
( all pieces ) ... xor 
{Hash for White king castling} xor {Hash for White queen castling} xor ... ( all castling rights )
```

The fact that xor-operation is own inverse and can be undone by using the same
xor-operation again, is often used by chess engines. It allows a fast
incremental update of the hash key during make or unmake moves. E.g., for a
White Knight that jumps from b1 to c3 capturing a Black Bishop, these operations
are performed:

```
{Original Hash of position} xor
{Hash for White Knight on b1} ( removing the knight from b1 ) xor
{Hash for Black Bishop on c3} ( removing the captured bishop from c3 ) xor
{Hash for White Knight on c3} ( placing the knight on the new square ) xor
{Hash for Black to move} ( change sides )
```

## Collisions

Key collisions or type-1 errors are inherent in using Zobrist keys with far less
bits than required to encode all reachable chess positions. 
