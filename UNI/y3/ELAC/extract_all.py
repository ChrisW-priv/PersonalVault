with open("./HW1_soultion") as file:
    data = file.read()

tasks = data.split("\n\n")
print(tasks)
for task in tasks:
    task_lines = task.split("\n")
    new_task = task_lines[:-1]
    task_name = task_lines[0].split(" ")[1]
    new_header = f"flowchart TD"
    new_task[0] = new_header
    del new_task[1]
    task_body = "\n".join(new_task)
    with open(f"./{task_name}.mmd", "w") as new:
        new.write(task_body)

