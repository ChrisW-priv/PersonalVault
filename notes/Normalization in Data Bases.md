---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Normalization in Data Bases
---

> [!Definition]
> Process of structuring a relational database in accordance with a series of so-called **normal forms** in order to reduce data redundancy and improve data integrity. 

## Notation

For consecutive levels of normalization we will note then as:

 - 1 NF
 - 2 NF
 - 3 NF
 - ...
 NF stands for Normal Form.
 Each level of normal form has additional rules that need to be followed on top of previous ones

## Normal Forms rules

### 1 NF

 - Using row order to convey information is not permitted
 - Mixing data types within the same column is not permitted
 - Primary key is obligatory
 - Repeating groups are not permitted

### 2 NF

 - Informally: Each non-key attribute must depend on the entire primary key

### 3 NF

 - No dependency of attributes is allowed in single row
Every attribute in a table should depend on the key, whole key and nothing but the key.

### 4 NF

 - Multi-valued dependencies in a table must be multi-valued based on key

### 5 NF

 - Any table cannot be a result of joining other tables together

## Intuition

Normalization and normal forms cannot prevent us from providing wrong data, but will protect us against data that logically makes no sense. Ideas like multiple dates of birth for one person. Errors like that are called "failure of data integrity" as data disagrees with itself.

This normalization can be divided into multiple levels of "security" such that each consecutive level is even more strict on what can be done in such model.
