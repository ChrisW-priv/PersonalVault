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

Notes: cześć wszystkim, zostałem poproszony o przygotowanie prezentacji nt. Gen AI. no to... jestem :) Do tworzenia tej prezentacji użyłem nowego narzędzia, mam nadzieję że się nie wysypie, jak coś no to improwizacja

---

## Agenda

- Gen AI overview
- Examples of tools using AI
- Building AI systems
- Case study of the SPA project

Notes: krótko o tym co tu będzie:<br>zaczniemy od krótkiego powtórzenia czym jest gen AI<br>pokażę kilka narzędzi których używam lub które dopiero zacząłem ale wyglądają obiecująco,<br>Pokażę jak się robi tego typu apki i na koniec pokażę konkretnie projekt SPA w którym brałem udział

---

## How to get token ?

1. Get axpo.com account
2. Login on Citrix
3. Follow instructions on: <br>https://mingle.axpo.com/display/GAI/Request+new+project

Note: Zacznijmy od tego że użycie LLM'ów to pay to play -> you need token to access the APIs

---

## Gen AI (Text) overview

--

## Language Model

- Generate text by predicting **next token** <br> (auto-regressive)
- LM training is **data compression**
- Impossible to train to change *specific* behavior (inscrutable artifacts)
- **Need of application** to run the model <br> (obvious, but important for later)

Notes: The LM compresses the data by creating the internal models of the world. This view is directional. 
There are advances in interpretability, but this field is too young to be relevant in the big scale.

--

> [!Important]
> Using fine-tuning to teach model is a mistake!

Note: żeby rozszerzyć wiedzę LLM powinniśmy użyć metody "in context learning", w praktyce lepiej znaną jako RAG.

--

## Retrieval Augmented Generation (RAG)

as the name suggests, there are 3 stages

- **Retrieval** of query relevant information
- **Augmenting** the *Original Question* to include retrieved documents
- **Generation** of response by LM inference with newly created prompt

--

## Tool calling

> [!Important]
> Tool calling is the same as "structured output"

**YOU** call the code. AI is there to decide *which* tool to use.

--

**ANY** tool calling needs to be done with extreme care!!!

Note: Notice that we may not just break the system or delete all records in a database but also accidentally, share personal details.

--

## AI workflows

--

## Workflows vs agents

---

## AI powered tools

--

## ChatGPT

- Reasoning
- Image generation
- Deep research

--

## Claude Code

![](notes/attachments/Pasted%20image%2020250414150528.png)

--

## Aider

![](notes/attachments/Pasted%20image%2020250414150832.png)

--

## Other

- Cursor
- Zed

Notes: On Cursor: from demos: **insanely good auto complete**<br>On Zed: looks really promising, but didn't play with the Linux version yet. It is **Free** and *has first class support for git + vim*


---

## Building AI systems

--

## Biggest lesson

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

Note: So because we cannot change the model, we split our attention into tools and prompts

--

## MCP

![](notes/attachments/Pasted%20image%2020250414150344.png)

--

![](notes/attachments/Pasted%20image%2020250414153032.png)

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

--

## Features

- QA
- Function execution (possible, not utilized)
- Asynchronous file processing
- RBAC that spans tree of files
- Fast (cheap) CI
- Full minimal standards (+uv PoC)

--

## HLA

![](notes/attachments/SPA%20-%20Arch.%20-%20HLA.png)

--

## Current Arch

![](notes/attachments/SPA%20-%20Arch.%20-%20Page%201.png)

--

## Proposed next steps

- Utilize MCP standard
    - Split our logic for MCP 
        - Client that defines behavior
        - Servers that provide tools + context
    - Requires the Knowledge Base as separate MCP server
- Make better RBAC (open for ideas/help/assist)
- Better file processing
    - OCR (better)
    - Deeper indexes
    - Use Kafka<br>(not necessary but keeps arch unified)
- Landing Zone transition