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

- Gen AI overview
- Examples of tools using AI
- Building AI systems
- Case study of the SPA project

---

## How to get token ?

1. Get axpo.com account
2. Login on Citrix
3. Follow instructions on: <br>https://mingle.axpo.com/display/GAI/Request+new+project

Note: LM game is pay to play -> you need token to access the APIs

---

## Gen AI (Text) overview

--

## Language Model

- Generate text by predicting **next token** <br> (auto-regressive)
- LM training is **data compression**
- Impossible to train to change *specific* behavior (inscrutable artifacts)
- Need application to run the model <br> (obvious, but important for later)

Notes: The LM compresses the data by creating the internal models of the world. This view is directional. 
There are advances in interpretability, but this field is too young to be relevant in the big scale.

--

> [!Important]
> Using fine-tuning to teach model is a mistake!

Note: To extend the general knowledge the Retrieval Augmented Generation method
should be used

--

## Retrieval Augmented Generation (RAG)

as the name suggests, there are 3 stages

- **Retrieval** of query relevant information
- **Augmenting** the *Original Question* to include retrieved documents
- **Generation** of response by LM inference with newly created prompt

--

## AI workflows

--

## AI agents

--

## Workflows vs agents

---

## AI powered tools

--

## ChatGPT

- Image generation
- Deep research

--

## Claude Code

--

## Aider

---

## Building AI systems

--

> [!Important]
> "AI application" is actually an "application with AI"

--

### What does it mean?

In the big picture, AI is **just another feature**. 

AI by itself is **just an artifact**.<br>You need the ability to connect it with *something*.

Note: Also: other important features include: security, logging, backups,
scalability, compliance (legal), user tutorials.
Now, having that in mind *next slide*

--

Having that in mind LMs are likely to be in the center of the future application design philosophy

![](notes/attachments/Pasted%20image%2020250411135314.png)

Note: much like the cpu is the center of the computer, the LMs will be the
center of the app, thus it makes sense that we will take lessons learned and
apply them here. Examples: hardware acceleration - model finetuning.

--

AI performance is defined by:

- Model
- Context
- Prompt

--

## GenAI model (text)

1. Define problem
2. Collect examples 
3. Run prompt optimization for different models
4. Evaluate: is perf. satisfactory? 
    1. Yes: goto 5.
    2. No: goto 2. or redefine what you want
5. Deploy and Monitor

Note: you can try to **generate** the examples

--

## Prompt Engineering

Techniques proven to work:

- **Prompt Templates**: Using templates that organize the information in a specific formats <br> (ex. HTML or YAML).
- **Few-Shot Learning**: Providing a few input/output pairs within the prompt to guide the model
on how to perform a specific task.
- **Chain-of-Thought Prompting**: Encouraging the model to generate intermediate reasoning
steps before arriving at a final answer.

--

But you should not attempt to make the prompt yourself (use DSPy instead)

![](notes/attachments/Pasted%20image%2020250411145431.png)

Note: the LMs have been proven to be unstable (tiny prompt changes result in massive perf. boosts).
Unless you are doing some quick scripting to just make it work (or need to leverage some low level functions of the LM provider, that are not available in the DSPy yet)

---

## SPA project case study

---

## Features

- QA
- Function execution (possible, not utilized)
- Asynchronous file processing
- RBAC that spans tree of files
- Full minimal standards