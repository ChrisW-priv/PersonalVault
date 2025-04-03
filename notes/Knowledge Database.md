---
title: Knowledge Database
description: Considerations when building a knowledge database
date: 2025-02-14
tags: 
categories:
  - zettelkasten
---

Knowledge Database, just like any other database needs to support the CRUD
operations:

- Create
- Read
- Update
- Delete

Additionally, it needs to allow restricting the access of the users to only
selected parts of the knowledge pool. Some users should be able to modify
the content (moderators), some should only be able to read the content (users).

It is useful to realise that the problem domain is really close to search engine
domain space. After all, we are not building the Knowledge Database just to have
it. Rather, we build it to easily retrieve information from it.  

Instead of thinking about the operations on this Database in terms of CRUD, it
is better to translate the operations into more day-to-day tasks like:

- Query (Read)
- Ingest (Create)
- Operations (Update/Delete)

Before we define the concrete operations, it is best, to define the datatypes
that we will work with. 

- Data
    - **Source** - this could be a file, web page, message, or other. The smallest
    unit of information available for the user to perform operations on.
    - **Collection** - as the name suggests, this is a grouping of **sources** to
    make management simpler, similar to folder or a directory.
    - **Project** - this is yet another abstraction that allows groping of **sources**
    - **Organisation** - root of the **source** grouping hierarchy. Very useful,
    when considering the possibility of serving businesses that want managed service
    - **Connector** - Code allowing for automatic ingestion of data from outside source 
    into the *Knowledge Database*. It will be responsible for ingestion of new
    content as well as automatic updates of the content. 
    - **Feed** - Source of dynamic data ingestion. This could be an e-mail message
    stream, or web-hook notifications from different apps.
- Users
    - **User** - pair of username + authentication method.
    - **Team** - user group.
    - **Organisation** - Root of **user** grouping hierarchy.

Then, we could list the intended behaviour easily by simply assigning the
functionality into one of those 3 buckets:

