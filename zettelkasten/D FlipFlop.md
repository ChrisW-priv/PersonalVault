---
title: "D FlipFlop"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

## Definition

Based on [D Latch](D%20Latch.md). Instead of taking the raw clock signal as input now we consider only "rising edges" to be our "E" signal on the input. 

## Intuition

To make our d Latch respond only to rising edge of D flop we have to make a signal transformation taht yields a pulse when there in a rising edge. 

We could achieve it with and [AND gate](AND%20gate.md) with input of $E$ and $\bar{E}$. This results in a small delay on [NOT gate](NOT%20gate.md) that allows us to get a very short pulse that will allow us to use D latch in this new way.

What we can also do is we can take the capacitor and resistor. as shown below: 

![Pasted image 20221116221006](attachments/Pasted%20image%2020221116221006.png)

This way is much easier, and cheaper.

good explenation of d flipflops can be found in [this video](https://www.youtube.com/watch?v=YW-_GkUguMM)
