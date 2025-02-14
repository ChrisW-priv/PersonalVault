---
title: "Binary Search Tree (BST)"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

## Definition
BST is a [Tree](Tree.md) that has special property of being ordered in folowing way:
- Each node has at most two children called "left" and "right". 
- "left" child must be smaller that it's parent and "right" must be bigger

## Traversing tree
- visit node first
- visit subtrees first

Three different traversals:
- Inorder (LNR) - Traverse left-first
- Preorder (NLR) - Traverse node-first 
- Postorder (LRN) - Traverse subtrees-frist

### Use of the traversioning orderings
- Inorder (LNR)
Printing the elements in an order

- Preorder (NLR) 
When searching the tree, we always compare the node first after descending to sub-trees

- Postorder (LRN)
In a destructor, we always want to destroy the tree "bottoms-up"

## Code
The binary tree should be done for a specific application as it done for optimisation reasons. However a basic BST will be available here in the future: #TODO 

Needed methods:
- isEmpty
- search for item
- insert item
- delete an item
- get height
- get number of nodes
- get number of leaves
- copy
- get elements

> [!Note] 
> While the naive implementation is easy to do, to make the methods efficient is really hard! Problem will always lie in making and keeping the tree balanced to maintain optimal $O(log(n))$ time!

## Intuition
Search for any element in the tree is done in $O(log(n))$ time IF THE TREE IS BALANCED. In the worst case the search time can be $O(n)$!
