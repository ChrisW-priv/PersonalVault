---
title: "JK FlipFlop"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

[Flip-Flops](Flip-Flops)
## Definition
A JK flip-flop (Jack-Kilby flip-flop) is a type of [electronic circuit](electronic%20circuit) that is used to store and manipulate [binary information](binary%20information). It is a type of [bistable circuit](bistable%20circuit), which means that it has two stable states that it can assume, and can be easily switched between those states in response to external inputs.

A JK flip-flop is made up of two logic gates, typically an AND gate and an OR gate, and a pair of inverters. The inputs to the circuit are a J (set) input, a K (reset) input, and a clock (CLK) input, and the outputs are the Q and Q' (not Q) outputs. The Q and Q' outputs are the complements of each other, meaning that one is always the opposite of the other.

The J and K inputs control the state of the JK flip-flop. When the J input is 1 and the K input is 0, the JK flip-flop is in the set state, and the Q output will be 1 and the Q' output will be 0. When the J input is 0 and the K input is 1, the JK flip-flop is in the reset state, and the Q output will be 0 and the Q' output will be 1.

The clock input is used to control when the JK flip-flop can be switched between the set and reset states. When the clock input is 1, the JK flip-flop will respond to the J and K inputs and switch between the set and reset states if necessary. When the clock input is 0, the JK flip-flop will hold its current state and will not respond to the J and K inputs.

The JK flip-flop has the following truth table, which shows the outputs for all possible combinations of J, K, and CLK inputs:

The JK flip-flop can be used to store binary information, and can be easily switched between the set and reset states in response to external inputs. It is commonly used in digital circuits to store and manipulate binary data, and is a fundamental building block of many digital devices.

## Notation
### Implementation with [NAND gate](NAND%20gate.md)
![300](attachments/Pasted%20image%2020221116205154.png)

#### Truth Table
For clk = 1:
|$J K$|$S R$|$Q \bar{Q}$|result|
|:-:|:-:|:-:|:-:|
|00|11|01|No change|
|10|01|10|Set $Q=1$|
|01|10|01|Set $\bar{Q}=1$|
|11|00|Not-defined|Not allowed!|

For clk = 0: same as for clk=1, $JK$ = $00$

## Intuition
