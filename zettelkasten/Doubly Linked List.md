---
title: "Doubly Linked List"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

## Definition

An extension of [Singly Linked List](Singly%20Linked%20List.md). Difference is that each node holds `data`, `next` pointer AND `prev` pointer. This makes any algorithm modifying the doubly linked list MUCH easier than in singly linked list.

## Notation

```mermaid
graph LR
    head --> A{{A}} -->|next| B{{B}} -->|next| C{{C}} -->|next| D{{D}}
	D -->|prev| C -->|prev| B -->|prev| A
```
