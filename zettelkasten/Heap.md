---
title: "Heap"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

# Heap
## Definition
A Heap is a special [Data Structure](Data%20Structure).

Heap can hold:
- values
- key-value pairs that are stored based on **value**

## Two types of heaps:
1.  **Max-Heap**: In a Max-Heap the key present at the root node must be greatest among the keys present at all of it’s children. The same property must be recursively true for all sub-trees in that Tree.
2.  **Min-Heap**: In a Min-Heap the key present at the root node must be minimum among the keys present at all of it’s children. The same property must be recursively true for all sub-trees in that Tree.

## Operations of Heap Data Structure
- **Heapify:** a process of creating a heap from an array.
- **Insertion:** process to insert an element in existing heap time complexity O(log N).
- **Deletion:** deleting the top element of the heap or the highest priority element, and then organizing the heap and returning the element with time complexity O(log N).
- **Peek:** to check or find the most prior element in the heap, (max or min element for max and min heap).
- **DecreaseKey**: decrease certain key value (but also preserves heap property after call)
- **size**: checks how many elements there are 
- **isEmpty**: checks if size property is equal to zero

## Implementation
It is often implemented as an [Array](Array) and visualised using a [Tree](Tree.md).
