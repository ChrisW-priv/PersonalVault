---
title: Min Max Solver
description: Position solver for MiniMax games
date: 2025-03-26
tags:
  - project
  - minimax
important: false
status: todo
---

## Action Items

- [ ] Make note on the techniques:
    - Min Max
    - Alpha Beta pruninng
    - transpositions
    - iterative deepening
    - ordering the moves
    - heuristics
    - probabilistic eval
    - etc...
- [ ] generate an early implementation that will allow us to create test cases + interface
- [ ] abstract away the steps into ordered instructions
- [ ] Make impl. in a high perf. lang.
    - Maybe try ZIG? This seems to kill 2 birds with one stone: I still need to
    be able to operate in C style langs.
- [ ] Choose some metric for speed calcs. and design pipeline to optimize the code

## Ideas

### State management

This problem is VERY close to the graph theory problem, so we need a good way of storing graphs.

Maybe we should recognize that for big enough graphs we cannot store it in memory? (benchmark)

But for now: just make a vector of states that store a state like: metric, position desc., etc. ID of state will be an index in this 

### Transpositions

Maybe have a transposition table as hashmap where:
 1. Check if current board has assigned id
 2. If yes: just mark the node with the same score as the one  with the same id; TERMINATE
 3. If no: this is a never before seen board
 4. pick next id not yet chosen
 5. save the board into the hashmap of board_state_hash -> id
 6. use a "generate transpositions" function and save them with the same id


In some cases: doing this eagerly will not help cuz for ex. in tic-tack, when you go deep enough: there are no possible symmetries.

But on the other hand: when we iteretively deepen -> this will actually save us time.