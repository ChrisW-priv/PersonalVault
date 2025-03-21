---
title: Circular Singly Linked List
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

## Definition

An extension of [Singly Linked List](Singly%20Linked%20List.md) that allows for insertions at the beginning as well as at the end without extra pointer for "end". Also called Singly Linked Ring.

## Notation

```mermaid
graph LR
    last-->B{{node Z}} -->|next| C{{node p}} -->|next| D{{node}} -->|next| E{{node}} -->|next| B
```
