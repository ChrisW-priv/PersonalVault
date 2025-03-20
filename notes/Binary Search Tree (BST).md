---
title: Binary Search Tree (BST)
description: A Binary Search Tree (BST) is a data structure that maintains sorted
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

## Definition

A Binary Search Tree (BST) is a specific type of Tree that has the following properties:

- Each node has at most two children, referred to as the "left" and "right" child.
- The "left" child contains a value less than its parent node's value, while the "right" child must have a value greater than its parent node's value.

## QA Structure

### What is a Binary Search Tree?

A Binary Search Tree is a data structure that organizes data in a way that allows for fast retrieval. Each node adheres to specific rules that define its relationship with other nodes.

### How to traverse a Binary Search Tree?

Traversing a binary search tree involves visiting nodes in a specific order. There are three primary types of traversal:

1. **Inorder (LNR)** - Traverse the left subtree first, then the node, followed by the right subtree.
2. **Preorder (NLR)** - Visit the node first, then traverse the left subtree followed by the right subtree.
3. **Postorder (LRN)** - Traverse the left and right subtrees first, and then visit the node.

### What is the use of each traversing order?

- **Inorder (LNR)**: This traversal method produces a sorted sequence of the elements, allowing for easy printing in order.
  
- **Preorder (NLR)**: In this method, we visit the node before its subtrees, which is useful for creating a copy of the tree or searching it.

- **Postorder (LRN)**: This traversal is particularly useful for destructors since it visits children before their parent, enabling proper deallocation of memory.

## Code

> [!Note]
> While the naive implementation of a BST is straightforward, achieving efficient methods can be challenging. The main issue often lies in balancing the tree to maintain optimal $O(\log(n))$ performance.

## Intuition

Searching for any element in a balanced binary search tree is performed in $O(\log(n))$ time complexity. However, in the worst-case scenario, when the tree becomes unbalanced, the search time can degrade to $O(n)$. 

The BST structure is effective for searching and maintaining order, but it is essential to consider its balancing properties for optimal performance.
