```dataviewjs
function getPriority(task) {
    // we want important first, then urgent first
    // most important -> 0, least -> 3
    return (task.important - 1) * 2 + (1 - task.urgent)
}

function mapPriorityToName(taskPriority) {
    const names = {
        0: 'Do',
        1: 'Schedule',
        2: 'Delegate',
        3: 'Delete',
    }
    return names[taskPriority]
}

function stripInlineTags(text) {
    return text.replace(/\[[^\]]*::[^\]]*\]/g, '').trim();
}
let pages = dv.pages('"zettelkasten" and #project')

for (let page of pages) {
    dv.header(2, page.title)
    let tasks = page.file.tasks
    dv.table(["task", "priority"], 
        tasks.sort(t => getPriority(t))
             .map(t => [stripInlineTags(t.text), mapPriorityToName(getPriority(t))])
    )
}
```
