---
title: running ollama
description: ""
date: 2025-03-30
tags:
  - ollama
categories:
  - zettelkasten
draft: false
---

On AMD GPU:

```bash
docker run\ 
    -d --device /dev/kfd --device /dev/dri\
    -v ollama:/root/.ollama\
    -e HSA_OVERRIDE_GFX_VERSION="10.3.0" -e OLLAMA_KEEP_ALIVE=-1 -e OLLAMA_MAX_LOADED_MODELS=2\
    --name ollama\
    -p 11434:11434\
    ollama/ollama:rocm@sha256:90c70d2b4840d18e6fe434af27970cd23deb5335225188cf7dfbc538b37fc5d6
```

But for now, cuz I have oai key then I still run only:

```bash
aider --model openai/o1-mini
```
