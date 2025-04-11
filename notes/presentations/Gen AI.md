---
title: Gen AI
description: Presentation on state of the Gen AI
date: 2025-04-11
tags:
  - presentation
theme: white
transition: none
---

# Gen AI

Krzysztof Watras

---

## Agenda

- Exploration of AI space
- Tools utilizing the GenAI
- Combining AI with tools to build full AI systems
- Case study of the SPA project

---

## Gen AI (Text)

- Trained to generate text by predicting next token (auto-regressive)
- LM training is data compression
- Impossible to train to change *specific* behavior (inscrutable artifacts)
- Need application to run the model <br> (obvious, but important for later)

Notes: The LM compresses the data by creating the internal models of the world. This view is directional. 
There are advances in interpretability, but this field is too young to be relevant in the big scale.

---

LMs are likely to be in the center of the application design philosophy

![](../attachments/Pasted%20image%2020250411135314.png)

Note: much like the cpu is the center of the computer, the LMs will be the
center of the app, thus it makes sense that we will take lessons learned and
apply them here

---

## Promising tools

- Aider
- Claude Code

---

## Building AI systems

> [!Important]
> "AI application" is actually an "application with AI"

--

### What does it mean?

In the big picture, AI is **just another feature**.

Do not forget that we still 