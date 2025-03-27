---
title: important-undone
description: Dashboard of all tasks that are deemed important
date: 2025-03-20
tags:
  - dashboard
---

## Life - in progress

```dataviewjs

let pages = dv.pages('"projects" and #project and !#work').where(page => page.important && page.status === 'in-progress');

for (let page of pages) {

    let tasks = page.file.tasks
        .where(t => !t.completed)  // Exclude completed tasks
        .where(t => t.important || t.important === undefined)   // Exclude unimportant tasks

    dv.taskList(tasks)
}

```

## Work - in progress

```dataviewjs

let pages = dv.pages('"projects" and #project and #work').where(page => page.important && page.status === 'in-progress');

for (let page of pages) {

    let tasks = page.file.tasks
        .where(t => !t.completed)  // Exclude completed tasks
        .where(t => t.important || t.important === undefined)   // Exclude unimportant tasks

    dv.taskList(tasks)
}

```

## Important TODO

```dataviewjs

let pages = dv.pages('"projects" and #project').where(page => page.important && page.status === 'todo');

for (let page of pages) {

    let tasks = page.file.tasks
        .where(t => !t.completed)  // Exclude completed tasks
        .where(t => t.important || t.important === undefined)   // Exclude unimportant tasks

    dv.taskList(tasks)
}

```
