---
title: "Project workflow"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

General project workflow that involves multiple contributors:

1. Project leader must first research the topic of the project thoroughly.
2. The project leader creates a project plan and assigns tasks to each contributor.
3. Leader also needs to establish means of communication and work documentation as well as version control system. 
4.  Each contributor is responsible for completing their assigned tasks according to the project plan.
5.  As contributors complete their tasks, they document their progress into a shared version control system.
6.  The project leader manages progress of team members and controls merges into the main branch of the project. He has to ensure that everyone is working off of the latest version.
7.  This process continues until all tasks are completed and the project is ready for final review and delivery.

Of all points point 3. is perhaps the most important. Ideally every team member should be easily replaceable based on the fact that his work status is clear and other people know exactly what to do and how.

Setup your project to follow what->why->how. This will make it clear to any new person what to expect and not be lost in a maze of your repo.

Communication channels should have:
- at least 2 voice channels where members can meet and talk. 
- 1 summary channel to point to resource that one might need
- 1 channel of chat type to allow to store outside information like notifications, deadline information etc.
- 1 general channel for indicating problems and share knowledge.
Examples:
1. Discord
2. Slack 
3. MS Teams

VC system should have:
1. outside server hosting the project versions
2. be able to indicate issues and handle git merges and alike

Examples:
1. Git -> github/gitlab

## Extra:
Good idea is to create linters for the project to keep the code in a standardized way. 

