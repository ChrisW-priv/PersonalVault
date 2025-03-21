---
title: deemed-unimportant
description: Project that are listed, but deemed unimportant (for now)
date: 2025-03-20
tags:
  - dashboard
---

```dataviewjs
let pages = dv.pages('"projects" and #project')
    .where(p => !p.important && p.status !== 'done')
    .sort(p => p.date, 'desc'); // or 'asc' if you want newest first

dv.table(["Project", "Description"], 
    pages.map(p => [
        p.file.link, 
        p.description || "No description"
    ])
);
```
