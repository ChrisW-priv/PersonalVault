---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: SR Flip-Flop
---

[Flip-Flops](Flip-Flops)

## Definition

A SR flip-flop (Set-Reset flip-flop) is a type of [electronic circuit](electronic%20circuit) that is used to store and manipulate [binary information](binary%20information). It is a type of bistable circuit, which means that it has two stable states that it can assume, and can be easily switched between those states in response to external inputs.

A SR flip-flop is made up of two logic gates, typically an AND gate and an OR gate, and a pair of inverters. The inputs to the circuit are a set (S) input and a reset (R) input, and the outputs are the Q and Q' (not Q) outputs. The Q and Q' outputs are the complements of each other, meaning that one is always the opposite of the other.

When the S input is 1 and the R input is 0, the SR flip-flop is in the set state, and the Q output will be 1 and the Q' output will be 0. When the S input is 0 and the R input is 1, the SR flip-flop is in the reset state, and the Q output will be 0 and the Q' output will be 1.

The SR flip-flop has the following truth table, which shows the outputs for all possible combinations of S and R inputs:

The SR flip-flop can be used to store binary information, and can be easily switched between the set and reset states in response to external inputs. It is commonly used in digital circuits to store and manipulate binary data, and is a fundamental building block of many digital devices.

## Notation

### Implementation

Based on [SR Latch](SR%20Latch.md) and [AND gate](AND%20gate.md). we use an extra signal from clock combined with and gates to extend the SR latch. 

Using [AND gate](AND%20gate.md) and [NOR gate](NOR%20gate.md):

![Pasted image 20221116203152](attachments/Pasted%20image%2020221116203152.png)

### Truth table

The same as [](SR%20Latch.md#Truth%20Table|here) if clock value is 1

else: there is no change

## Intuition