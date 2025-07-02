---
title: "Sales Partner Assistant"
description: ""
date: "2025-04-03"
tags:
  - project
important: true
status: todo
---

## Motivation

- We can test new standards cheaply and with low risk impact.
- We can scale the support team when it comes to the QA tasks

Approx. there are 140 questions a month right now, each of them would take at
least 15 minutes (1/4 of an hour) to answer. Multiply that times 12 months and
80pln/h. Given a better setup, we expect it to increase by 100% due to increased
trust + expanded knowledge and capabilities.

$$
280 * 1/4 * 12 * 80 = 67'200
$$

Additionally, there is a set of questions that are impossible to answer right
now, but we could answer if there was a better setup. There are currently
approximately 1000 requests that takes form 1h to 1.5h. 10% of them we could
reasonably solve with the AI agent that would autonomously solve the requests.
Thus:

$$
1000 * 15 / 100 * 1.5 * 80 * 12 = 1'440'000
$$

There is also a matter of testing the internal tools (real-world project,
allowing for test by fire). We base our calculations on the fact that
historically, with the setup of new, complex tech, it took from 1mo, to 2mo for
full best practice resolution. Thus, if any other team was to make that
sacrifice, they would be limited by scope and could not deliver the feature
(also loosing money). This is a one time cost, for each feature, and we expect
the use of: landing zone, kafka, elastic search. Being generous, it'll likely
take around 1mo for full adoption and creation of best practice docs for other
teams to seamlessly adopt the tech after "lessons learned". so there is cost of
one full time dev not working on the project, that we allow to work again, say
20000 pln/mo.

$$
20000 * 3 = 60000
$$

Finally, there is the achievement of the SME goal "It is easy to work with Axpo",
as well as we can use it as a staging ground for the same tools for clients, or 
internal tool for Axpo employees. Those fields are really close and pose similar 
time saving advantages.

## Action Items

- [x] Build better log of QA - collect AI responses as well
- [ ] Rewrite to use MCP instead
    - Learn how to setup servers
    - Research the current list of instructions for already built MCPs
    - Build MCP client 
- [ ] Make use of better chunking

### Main idea

I think it is best to first split the text in a top-down manner:

1. Take the abstract + index + summary etc. to create first node
2. Repeat the step 1 for all subsections recursively (include the parent, summaries) (lowest level is a heading + paragraph text)

Each node should contain:

- **Title** - Text that defines the node
- **Text** - Actual text of the node
- **Sumary** - What is this node about
- **Definitions** - Pair of Term-Explanation
- **Procedures** - List of steps to achieve some task
- **Keywords** - Phrases that will help find this node
- **Flashcards** - Question-Answer pairs
- **Links** - What nodes are related to the note.
    - Embedded files (images)
    - Related Ideas ("See also" links)
    - Mentioned files (hyperlinks that link to other files but are not related in a semantic sense)

I need to do better chunking such that the split between the chapters is more clear. 

Then, I need to chunk the text in a RAPTOR way:

At this step we have all of the main ideas covered (what the chapters are about).
But we still desperately need the links between ideas in a book. Often, ideas
later in the book are explained in the chapters before, but some ideas are
explained only after some ground truth was established.

4. Try clustering the ideas and questions in the notes
5. For each cluster:
    1. Identify if it really is a cluster that makes sense
    2. Make a note on the logical argument for the relation between the notes.