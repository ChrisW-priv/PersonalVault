---
title: "PriorityQueue"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

## Definition
Priority Queue is a abstract data-type that has `priority` argument attached to every element. When dequeuing elements we receive them in either ascending or descending order depending on priority they were added in. In case of the same priority we usually default ro regular [Queue](Queue.md) standard.

## Implementations
Most basic implementations often use [Heap](Heap.md) as a solution. Those work but are often quite inefficient (not as efficient as they could be). 

## Intuition
