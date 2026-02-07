---
title: Build Better MCP Servers
description: Set of rules to obide by when doing MCP serves for AI agents
date: 2026-02-07
tags:
  - mcp
  - ai-agents
categories:
  - zettelkasten
draft: false
---

from: https://www.youtube.com/watch?v=96G7FLab8xc

Avoid:

- Agent as glue
    - Fragmented tools with fine-grained control
    - Fragile multi-step processes

Do:

- MCP as composition
    - One tool -> one user story
    - Names for agents: verb + intent

Avoid:

- Complex argument

Do: 

- Use a simple args, clear definitions, strong defaults, use `typing.Literal`