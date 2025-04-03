---
title: Knowledge Database
description: Considerations when building a knowledge database
date: 2025-02-14
tags: 
categories:
  - zettelkasten
draft: true
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
- Organize (Update/Delete)

Before we define the concrete operations, it is best, to define the datatypes
that we will work with. 

- Data
    - **Source** - this could be a file, web page, message, or other. The smallest
    unit of information available for the user to perform operations on.
    - **Collection** - as the name suggests, this is a grouping of **sources** to
    make management simpler, similar to folder or a directory.
    - **Project** - this is yet another abstraction that allows groping of **sources**
    - **Organisation** - root of the **source** grouping hierarchy. Very useful,
    when considering the possibility of serving businesses that want managed
    service.
- Ingest Mechanisms
    - **Manual** - user ingests the data manually, via API or UI.
    - **Connector** - Code allowing for automatic ingestion of data from outside source 
    into the *Knowledge Database*. It will be responsible for ingestion of new
    content as well as automatic updates of the content. 
    - **Feed** - Source of dynamic data ingestion. This could be an e-mail message
    stream, or web-hook notifications from different apps.
- Users
    - **User** - pair of username + authentication method. Could be a human or a
    robot.
    - **Team** - **user** group.
    - **Role** - list of pre-defined rules that allow easier management of the
    permissions.
    - **Organisation** - Root of **user** grouping hierarchy.
- Permissions
    - **Subject** - *who* is accessing the **resource**? In our case, always:
    **User**
    - **Resource** - *what* is being accessed? Could be any datatype defined in
    **Data** section
    - **Action** - *how* do we access the **resource**? Answers, "what is
    **user** trying to do with the **resource**" This could be "read", "modify",
    "create" etc.

Then, we could list the intended behaviour easily by simply assigning the
functionality into one of those 3 buckets:

- Query
    - **List Available** - Projects | Collections | Sources
    - **Query Source** - limit search to only selected **source**
    - **Query Collection** - limit search to only selected **collection**
    - **Query All Available** - retrieve relevant information from all available
    sources.
- Ingest
    - **Ingest Source**
        - *File* (*.txt*, *.md*, *.html*, *.pdf*, *.docx*, *.pptx*, etc.)
        - *Web Page* - Instead of single html file, result of a web scrape, or
        folder with multiple sites 
        - *Message* - status information from **Feed**. Could also be a message
- Organize
    - **Configure**
        - *Organisation*
        - *Project*
        - *Collection*
        - *Connector*
        - *Feed*
        - *Permissions*
    - **Add/Remove**
        - **User Relations** - hierarchy of the users in relation to teams,
        projects and organisations.
        - **Data Relations** - hierarchy of the data and the relation of Source
        to collections, projects and organisations.

Aside from the operations, on the database itself. One needs to also think about:

- Encryption - Data at rest and in transit is encrypted to protect sensitive
information.
- Audit Logging - Maintain logs of all access and modification activities to
monitor and audit user actions.
-  Backup and Recovery: *Systems* for data backup and recovery to ensure data
integrity and availability in case of system failures.
- Scalability: *How* accommodate growing data volumes and user numbers
- Compliance and Legal Considerations: *Consult* legal professionals if our
solution is not in violation of the current laws and regulations.
- User Training and Support: If users have no Idea how to use it - whey won't
try. Figure out how to make a docs that are easy to use with currently most
popular tools.

While the above specification captures the primary considerations of the 
Database, it does not specify how exactly it should be implemented.
After all, a database storing knowledge is different from one storing 
columnar structure of data, and thus, storing, indexing and retrieving data,
will be different enough to warrant a more custom approach.
Currently, there are many methods to query text databases.  `[...]`

Definitely, we want to do *chunking*, and we want to use
[vectors](Embedding%20Model.md) to store the meaning of that chunk in an easy to
find format.