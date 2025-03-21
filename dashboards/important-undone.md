---
title: important-undone
description: Dashboard of all tasks that are deemed important
date: 2025-03-20
tags:
  - dashboard
---

## Life


```dataviewjs

let pages = dv.pages('"projects" and #project and !#work').where(page => page.important && page.status !== 'done');

for (let page of pages) {

    let tasks = page.file.tasks
        .where(t => !t.completed)  // Exclude completed tasks
        .where(t => t.important || t.important === undefined)   // Exclude unimportant tasks

    dv.taskList(tasks)
}

```

## Work

```dataviewjs

let pages = dv.pages('"projects" and #project and #work').where(page => page.important && page.status !== 'done');

for (let page of pages) {

    let tasks = page.file.tasks
        .where(t => !t.completed)  // Exclude completed tasks
        .where(t => t.important || t.important === undefined)   // Exclude unimportant tasks

    dv.taskList(tasks)
}

```
