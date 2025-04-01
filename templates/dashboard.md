---
title: "<% tp.file.title %>"
description: ""
date: "<% tp.date.now("YYYY-MM-DD") %>"
tags:
  - dashboard
---

## <% tp.file.title %>

```dataviewjs
let pages = dv.pages('"projects" and #project')
    .where(p => !p.important && p.status !== 'done')
    .sort(p => p.date, 'desc'); // or 'asc' if you want newest first
```
