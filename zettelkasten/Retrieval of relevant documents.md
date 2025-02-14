---
title: "Retrieval of relevant documents"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---


Given the indexed database of documents that is in [numerical representation](Numerical%20representation%20for%20text%20search.md) we still want to retrieve the documents somehow. To do this, we need to perform [Embedding](Embeddings) operation again to retrieve the meaning of the question and then find [K nearest neighbors](KNN.md) to get all related documents from database.
