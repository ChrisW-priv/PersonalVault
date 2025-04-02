---
title: Knowledge Database
description: Attempt to create an open standard for fully customisable documentation.
date: 2025-04-03
tags:
  - project
important: true
status: todo
---

## Motivation

So the idea of Knowledge Database is not new. 
But I actually wholeheartedly believe that I can do better then the current solutions.
The way I see it there are way to many trade-offs that render the building of knowledge
graphs impractical for the average user.

Pain point examples:

- Cloud lock-in
    - I do not want to use a closed source method for something as CRUCIAL as knowledge management
- Poor customisability
    - Most implementations focus on one implementation like some proprietary vector database or AI provider.
    - I want to be able to host it in the cloud or have it running on local mini
    PC and only difference be the scale of files that I can support. 
- Poor low level Control
    - Data is often stored in flat structures that do not allow for easy retrieval or prompt build.

## Features I want

- Non-local references
    In case of the massive docs like the Python reference manuals, it is
    HIGHLY impractical to have that working in local mode, as in download the
    docs to local storage and have it sit there. Also: they don't change that
    much anyway so we can just index it once and have refs. to it to get full
    content.
- Full local mode
    In contrast to the non-local reference: I want to be able to pull
    all/selected data to local disk and have it sit there.
- Simple local index
    I want to be able to use as simple tech as possible in order to allow
    greater community support. This means using some sqlite3 database 
    with some custom vector extension maybe.
- Multi-modality support
    While this is still hit and miss, I want the ability to have an image sent
    and processed by LLMs to maybe get some insight.

## Action Items

- [ ] Build stable doc. of the intended solution
