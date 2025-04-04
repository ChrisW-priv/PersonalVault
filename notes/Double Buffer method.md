---
title: Double Buffer method
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---
[Data Structure](Data%20Structure)

## Definition

In computer science it's a method using 2 buffers of the same size to incorporate easier/more robust read/write methods. In principal, one buffer is used for read and the other for write. After needed computation buffers are swapped and process is repeated.

Commonly use in graphics rendering and state-based simulations.

## Common problems

### Rotating buffers

#### When this happens?

In a case that we write to "next" buffer **only** if condition is met we can get to a point where condition was true on last iteration but is never true after. Then we get continuously switching 2 state cell.

#### Solution:

There are couple of solutions:

1. We always call "match buffers" method at the end of iteration.
To ensure that all data of "next" and "current" is synchronised we can use "match buffers" method. This however is stupid - we throw all efficiency we gained out of the window and add more work to the runtime. resort to this only when desperate!

2. Always write the current state to "next" array. 
This makes sense because in sims we often work with "based on state check if state changes" logic. Then we write to "next" if we indeed need to change the state of the cell.
Therefore we can rewrite this such that is no change of state is detected we still write current state to "next". This does not impact performance much (we even can get rid of branch prediction part)

## Code

Code done unofficially as part of bigger project but is not yet ready to be available here.
