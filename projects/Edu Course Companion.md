---
title: Edu Course Companion
description: Program that helps user learn new fields effortlessly
date: 2025-08-08
tags:
  - project
important: true
status: in-progress
---

## Motivation

This project is done to streamline use of many of the science based learning
techniques like spaced repetition or active recall and others.
While those techniques are no doubt effective, they often take time to setup,
often in a meaning less and unproductive way. Key example is flashcards. 
It should not take so long to generate QA of that kind, now that we have proper
NLP AIs.

I also want to create a kind of a companion for the learning journey. It should 
be able to generate a dedicated course that will guide the user through the 
field they do not know.

## North Star

What I want to achieve is a dedicated platform for science based learning.

I want to be able to both start the course by super vague statements like 
"teach me biology" or "I want to become DevOps Engineer", but also more 
concrete statements like "I am a student at Uni, there is *Anatomy* course 
that I want you to teach me". I also want to be able to ground the new 
course in some materials given from the user. For example, when one is 
enrolled in the uni course about compilers and has some presentations 
about compiler theory, I want to parse it and limit the scope to the theory 
present on the lectures. Finally, I want the support for the academic paper
discovery. The agent should get the general topic, or read in the paper on 
the subject, follow the references and create an overview and extract the 
ACTUAL knowledge contained in the article or book.

I also want it to support the MCP protocol, such that the use can connect their
favourite LLM client and prompt the knowledge base for the knowledge.

## Solution

This program in general is huge. There are a lot of features that need custom
tuning (cannot be generalised well). Is consider it enough, if for now, I focus 
only on the provided files (no reference following) and not implement the
course generation. This leaves me with initial version to implement:

- Knowledge extraction
- Identification of main ideas | concepts | definitions | procedures 
- Storage of the extracted knowledge in some indexed way
- Flashcard generation
- MCP server interface

## Action Items

- [ ] Knowledge extraction pipeline
- [ ] Prompt for identification of ideas, definitions, procedure descriptions
- [ ] ORM model preparation of the knowledge, to allow the LT storage
- [ ] Prompt for creation of QA style flashcards of the new knowledge
- [ ] MCP server implementation
