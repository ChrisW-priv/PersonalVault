---
title: Finding PID that uses port on linux
description: Linux command to get the PID that uses some linux port
date: 2025-03-28
tags:
  - linux
categories:
  - zettelkasten
draft: true
---

Command with `11434` as port example

```bash
sudo netstat -nlp | grep :11434
```

Result:

```
tcp        0      0 127.0.0.1:11434         0.0.0.0:*               LISTEN      640/ollama
```

Then, the `PID = 640` and process that started it is `ollama`.

Now, this uses `netstat` which assumes you have `net-tools` installed.
