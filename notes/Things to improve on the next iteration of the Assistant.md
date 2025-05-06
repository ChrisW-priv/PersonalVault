---
title: Things to improve on the next iteration of the Assistant
description: Reflection on what is done right and what is to be improved in the iterations of the Assistant
date: 2025-05-06
tags: 
categories: []
draft: false
---

First, It is nice to acknowledge what did work:

- successful deployment of entire program
- async file processing and indexing (done over a celery queue)
- basic QA working
- code defined infra
- RBAC that is recursive over tree of relations (or even relations that form a DAG!)
- nice set of modern features in the CI
    - fast pipelines (caching of the results from previous runs)
    - tests that are both static lint, unit tests and the performance evals were created
    - use of many features like code reports, triggers etc.
- ability to call tools in a systematic way
- hints of logging and tracing + observability of state tools.
- explored some of the prompting/rag system evaluation techniques

So all in all, a really well rounded MVP that actually serves its purpose: it is both
working in prod as well as gave us a ton of learning opportunities. We touched 
basically all possible problems that can get hit (we did not cover all
technologies possible, rather the problems that we faced using *some* technology
allows us to make more informed decisions due to hind-sight). But of course,
this leaves us in the state that we definitely can do better. When looking at
the list above, there is no single point that cannot be improved by significant
margin:

1. File processing
    - Fundamental to the success of the alter stages, currently left in a state where it is extensible but unfinished.
    - In particular: there is no support for **images** or links
    - Further more, there is no standard expected output of the file: just some text that we can hope to be md formatted (but there is no guarantee)
2. File indexing is really naive.
    - We rely on the quality of the input which can be variable
    - File chunks are indexed with no context of the larger file
3. File queue is run manually
    - done to save the costs but will be unsustainable in the future, we need to make it continuous or at least event driven
    - for the queue, we could use kafka when it is setup
4. Database itself can prove to be a limit.
    - End goal is to put *everything* in the KB, thus reliance on pure vector with no filters becomes **incredibly naive** (can work in theory but is hard to imagine at scale)
    - Maybe use Elastic in the future?
5. RBAC needs a revamp
    - I have done the current setup in a hurry to push *something*, I tried to refactor it but i lacked but time and expertise.
    - Can definitely be a useful django app on it's own!
6. Tools architecture needs rethinking.
    - The current tools are functional but ad hoc; they need to be restructured into MCP tools.
    - Specifically, tools should be implemented as MCP servers, and the agent should become an MCP client.
    - This separation will allow us to build reusable, modular components like the KB or DB accessors that can be orchestrated independently.
    - Reasoning loops MCP client, where they can be managed in a deliberate (or even agentic) way.
7. Better observability
    - Current tools limit us significantly, we definitely should rethink our approach to logging and tracing in a more systematic way.
    - The existence of dashboards that inform what is our traffic, or what are some common questions, what is not covered?
    - Sources of bugs what caused the behavior that we can observe
8. Treat the system as one unit.
    - due to the complexity of it all, it is difficult to work on *everything* but it is necessary to improve the quality.
    - we need to rethink the expected way of interaction with the program
    - can we limit the input to only select types of input? (that would allow for higher quality index)
