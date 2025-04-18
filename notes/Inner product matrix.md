---
title: Inner product matrix
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---

> [!Definition]
> An inner product matrix is a type of [Matrix](Matrix.md) that is used to represent the inner product ([Dot product](Dot%20product.md)) of two vectors. 

## Computation

For a matrix $A$ and a result $B$ we calculate result using formula:

$$B=A{A}^T$$

## Intuition

An inner product matrix is a square matrix that is constructed by taking the inner product of a vector with itself. For example, if we have a vector `x`, the inner product matrix of `x` is a square matrix `A` such that `A[i,j] = x[i] * x[j]` for all indices `i` and `j`. In other words, the inner product matrix of a vector `x` is a matrix where each element `A[i,j]` is the product of the `i`th and `j`th elements of `x`.

## Application

Inner product matrices are often used in machine learning and other fields to represent the similarity between vectors. For example, in natural language processing, an inner product matrix can be used to represent the similarity between words in a corpus of text. The inner product matrix can then be used to identify patterns and relationships between the words in the corpus.
