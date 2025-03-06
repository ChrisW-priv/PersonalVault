```dataviewjs

let pages = dv.pages('"projects" and #project').where(page => page.important && page.status !== 'done');

for (let page of pages) {

    let tasks = page.file.tasks
        .where(t => !t.completed)  // Exclude completed tasks
        .where(t => t.important || t.important === undefined)   // Exclude unimportant tasks

    dv.taskList(tasks)
}

```
