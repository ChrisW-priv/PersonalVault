---
title: Data Base anomalies
description: No description provided.
date: 2025-02-14
tags: []
categories:
  - zettelkasten
---
[Database](Database)

In general anomalies that we focus on are the ones when data is modified. 

We have 3 main points of possible error:

 - Insertion 
 - Deletion
 - Update

To mitigate any of the errors that arise from them we need to ensure that each change that our Data base describes results in exactly one operation. 

We achieve this by following [normal forms](Normalization%20in%20Data%20Bases.md#Normal%20Forms%20rules).
