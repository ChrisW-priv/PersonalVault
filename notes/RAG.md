---
categories: []
date: 2025-02-14
description: No description provided.
tags:
- zettlekasten
title: RAG
---

## Introduction

**RAG** stands for **Retrieval Augmented Generation**.
As the name suggests it is comprised of 3 stages:

1. Retrieval of query relevant information
2. Augmenting the [[Original Question]] to include retrieved documents
3. Generation of response by [LM](LLM.md) inference with newly created prompt

## Why would we use a RAG method?

Some key advantages of Retrieval-Augmented Generation (RAG) systems are

explained in the subsections below:

### Improved Accuracy

By providing the context and some high quality external guidance, we expect the

LM to perform better in answering questions. 

### Dynamic Knowledge Base

In some cases the knowledge may be periodically changing. Simplest examples

would be answering a question "What is today's date?" or "Who is current

president of Poland?". Traditional method of model retraining would quickly 

be impractical. By extracting most up to date information, the assistant should 

be able to answer the questions where solutions are frequently being updated.  

### Personalisation

When we want to query the LM on some internal documentation or personal notes or

other topics where LM could not have been trained, we cannot reasonably expect

the LM to respond with correct information.

RAG systems can retrieve user-specific data or context, enabling more

personalized interactions and responses tailored to individual needs or past

interactions. Specially with the commercial solutions, the internal

documentation would be incredibly valuable for query optimisations.

### Domain-Specific Knowledge

Specially in niche or new topics, it is common for the LM not to be properly

trained for the query domain. However, with the retrieval of the relevant 

documents, the LM can perform just as well as in the fields where the sources

were plentiful in the training set.

### Cost Efficiency

RAG models are cost-effective in terms of both computational power and

maintenance. Instead of training extremely large language models, combining a

general-purpose model with external retrieval can achieve similar or better

performance at a lower cost.

### Reduction in Model Size

Since RAG systems don’t require all knowledge to be embedded within the model’s

weights, the language model itself can be smaller, reducing the computational

footprint and allowing deployment on lower-powered devices.

In the limit, assuming all possible knowledge can be easily retrieved, it would

be possible to train model to just rewrite the information to form where it is

easy for humans to understand.