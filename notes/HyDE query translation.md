---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: HyDE query translation
---

Method related to [Query translation](Query%20translation.md) where you try to

improve the hitrate of [RAG](RAG.md) by generating the **Hy**pothetical

**D**ocument and then **E**xtracting it.

## Why would this work?

Intuitively, we hope that this Hypothetical Document will be more closely related to the chunks we could find in the Indexed database, thus, we hope to find the chunks that are more closely related to the original question.
