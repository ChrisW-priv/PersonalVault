---
title: "RAG routing"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

[RAG](RAG.md)

Given a set of data collection descriptors like \["python docs", "js docs", "go

docs"\] we hope to first ask the LLM what descriptor will be needed to answer

the original question. 

## Why would we do it?

There are several reasons:

- Performance
- Data separation
- Limit irrelevant but seemingly related answers
- Tailoring the response based on the field

### Performance

For massive datasets it may be faster to call the LLM the question rather than to perform [Retrieval of relevant documents](Retrieval%20of%20relevant%20documents.md) and perform expensive search through entire set. 

### Data separation

If we can work on documentation of python, JavaScript and Go separately then we

can just redo the collections independently (prevent recalculation that is

unnecessary)

### Irrelevant answers

If the question is "how do I make hello world app in python" then it is possible

that in the embedding space, the hello world app part will be strong enough and

bring up the templates for Go on JS. If we limit the collection to python only,

then it is now impossible to hallucinate python-JS monster app that makes no

sense. 

### Tailored response

Knowing the field we can then tailor the response to the question.

(Different system messages or prompt templates or else)

For example we could recognise if the question is a math question or physics

question. 

Then we could steer the LLM with "You are math teacher" or "You are physics

teacher" type of prompt
