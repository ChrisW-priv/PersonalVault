---
title: Circular Doubly Linked List
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

## Definition

An extension od [Doubly Linked List](Doubly%20Linked%20List.md) also called Doubly Linked Ring.

## Notation

```mermaid
graph LR
    start --> A 
    A{{A}} -->|next| B{{B}} -->|next| C{{C}} -->|next| D{{D}}-->|next| A
	D -->|prev| C -->|prev| B -->|prev| A-->|prev| D
```
