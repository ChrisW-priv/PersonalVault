---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: Singly Linked List
---

## Definition

A linked list is a [Data Structure](Data%20Structure) that is based on nodes. Each node holds some `data` and a pointer to `next` node. Each node is stored on a [Heap](Heap.md) and therefore nodes are spread out across memory. 

> [!Warning]
> Remember! Single Linked List is highly inefficient because of the fact that it's not localized! If insertions and deletions are common and [Array](Array) cannot be used then consider better alternatives such as [Tree](Tree.md) like structure.

## Notation

Example of Single Linked List:

```mermaid
graph LR
    head --> A{{A}} -->|next|B{{B}} -->|next|C{{C}} -->|next|D{{D}}
```

## Code

If you REALLY need to use it then consider built-in data structure for your language.

Table that of names for those in different languages

| Language | Name                                    | library/module                                                                                                  |
| -------- | --------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| C        | Lol, yes, you will build it by yourself | or use solution in [this repo](or use [this repo solution](https://github.com/mkirchner/linked-list-good-taste) |
| C++      | `std::forward_list`                     | `#include<forward_list>`                                                                                        |
| Other    | ?                                       | ?                                                                                                               |