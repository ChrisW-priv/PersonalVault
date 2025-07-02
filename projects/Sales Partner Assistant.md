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

At this step we have all of the main ideas covered (what the chapters are about).
But we still desperately need the links between ideas in a book. Often, ideas
later in the book are explained in the chapters before, but some ideas are
explained only after some ground truth was established.

3. Try clustering the ideas and questions in the notes based on RAPTOR style (bottom-up)
4. For each cluster:
    1. Identify if it really is a cluster that makes sense
    2. Make a note on the logical argument for the relation between the notes.


Example node:

```
<section id="django-documentation">
    <h2>Django documentation</h2>
    <p class="rubric">Everything you need to know about Django.</p>
    <section id="first-steps">
        <h3>First steps</h3>
        <p>Are you new to Django or to programming? This is the place to start!</p>
        <ul class="simple">
            <li><p><strong>From scratch:</strong>
            <a class="reference internal" href="contents.html#document-intro/overview"><span class="doc">Overview</span></a> |
            <a class="reference internal" href="contents.html#document-intro/install"><span class="doc">Installation</span></a></p></li>
            <li><p><strong>Tutorial:</strong>
            <a class="reference internal" href="contents.html#document-intro/tutorial01"><span class="doc">Part 1: Requests and responses</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial02"><span class="doc">Part 2: Models and the admin site</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial03"><span class="doc">Part 3: Views and templates</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial04"><span class="doc">Part 4: Forms and generic views</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial05"><span class="doc">Part 5: Testing</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial06"><span class="doc">Part 6: Static files</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial07"><span class="doc">Part 7: Customizing the admin site</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial08"><span class="doc">Part 8: Adding third-party packages</span></a></p></li>
            <li><p><strong>Advanced Tutorials:</strong>
            <a class="reference internal" href="contents.html#document-intro/reusable-apps"><span class="doc">How to write reusable apps</span></a> |
            <a class="reference internal" href="contents.html#document-intro/contributing"><span class="doc">Writing your first contribution to Django</span></a></p></li>
        </ul>
    </section>
    <section id="getting-help">
        <h3>Getting help</h3>
        <p>Having trouble? We’d like to help!</p>
        <ul class="simple">
            <li><p>Try the <a class="reference internal" href="contents.html#document-faq/index"><span class="doc">FAQ</span></a> – it’s got answers to many common questions.</p></li>
            <li><p>Looking for specific information? Try the <a class="reference internal" href="genindex.html"><span class="std std-ref">Index</span></a>, <a class="reference internal" href="py-modindex.html"><span class="std std-ref">Module Index</span></a> or
            the <a class="reference internal" href="contents.html#document-contents"><span class="doc">detailed table of contents</span></a>.</p></li>
            <li><p>Not found anything? See <a class="reference internal" href="contents.html#document-faq/help"><span class="doc">FAQ: Getting Help</span></a> for information on getting support
            and asking questions to the community.</p></li>
            <li><p>Report bugs with Django in our <a class="reference external" href="https://code.djangoproject.com/">ticket tracker</a>.</p></li>
        </ul>
    </section>
    <section id="how-the-documentation-is-organized">
        <h3>How the documentation is organized</h3>
        <p>Django has a lot of documentation. A high-level overview of how it’s organized
        will help you know where to look for certain things:</p>
        <ul class="simple">
            <li><p><a class="reference internal" href="contents.html#document-intro/index"><span class="doc">Tutorials</span></a> take you by the hand through a series of
            steps to create a web application. Start here if you’re new to Django or web
            application development. Also look at the “<a class="reference internal" href="#index-first-steps"><span class="std std-ref">First steps</span></a>”.</p></li>
            <li><p><a class="reference internal" href="contents.html#document-topics/index"><span class="doc">Topic guides</span></a> discuss key topics and concepts at a
            fairly high level and provide useful background information and explanation.</p></li>
            <li><p><a class="reference internal" href="contents.html#document-ref/index"><span class="doc">Reference guides</span></a> contain technical reference for APIs and
            other aspects of Django’s machinery. They describe how it works and how to
            use it but assume that you have a basic understanding of key concepts.</p></li>
            <li><p><a class="reference internal" href="contents.html#document-howto/index"><span class="doc">How-to guides</span></a> are recipes. They guide you through the
            steps involved in addressing key problems and use-cases. They are more
            advanced than tutorials and assume some knowledge of how Django works.</p></li>
        </ul>
    </section>
    ...
</section>
```

Processed Node should be:

```
<node>
    <title>Django documentation</title>
    <text>
        <p>Everything you need to know about Django.</p>
        <section id="first-steps">
            <h3>First steps</h3>
            <p>Are you new to Django or to programming? This is the place to start!</p>
        </section>
        <section id="getting-help">
            <h3>Getting help</h3>
            <p>Having trouble? We’d like to help!</p>
        </section>
        <section id="how-the-documentation-is-organized">
            <h3>How the documentation is organized</h3>
            <p>Django has a lot of documentation. A high-level overview of how it’s organized
        </section>
        ...
    </text>
    <summary>
        This document is a documentation of django framework, contains answers on how to install and use django...
    </summary>
    <definitions>...</definitions>
    <procedures>...</procedures>
    <keywords>...</keywords>
    <flashcards>...</flashcards>
    <links>
        <embedded>...</embedded>
        <related>...</related>
        <mentioned>...</mentioned>
    </links>
</node>

<node>
    <title>First steps</title>
    <text>
        <p>Are you new to Django or to programming? This is the place to start!</p>
        <ul class="simple">
            <li><p><strong>From scratch:</strong>
            <a class="reference internal" href="contents.html#document-intro/overview"><span class="doc">Overview</span></a> |
            <a class="reference internal" href="contents.html#document-intro/install"><span class="doc">Installation</span></a></p></li>
            <li><p><strong>Tutorial:</strong>
            <a class="reference internal" href="contents.html#document-intro/tutorial01"><span class="doc">Part 1: Requests and responses</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial02"><span class="doc">Part 2: Models and the admin site</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial03"><span class="doc">Part 3: Views and templates</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial04"><span class="doc">Part 4: Forms and generic views</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial05"><span class="doc">Part 5: Testing</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial06"><span class="doc">Part 6: Static files</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial07"><span class="doc">Part 7: Customizing the admin site</span></a> |
            <a class="reference internal" href="contents.html#document-intro/tutorial08"><span class="doc">Part 8: Adding third-party packages</span></a></p></li>
            <li><p><strong>Advanced Tutorials:</strong>
            <a class="reference internal" href="contents.html#document-intro/reusable-apps"><span class="doc">How to write reusable apps</span></a> |
            <a class="reference internal" href="contents.html#document-intro/contributing"><span class="doc">Writing your first contribution to Django</span></a></p></li>
        </ul>
    </text>
    <summary>...</summary>
    <definitions>...</definitions>
    <procedures>...</procedures>
    <keywords>...</keywords>
    <flashcards>...</flashcards>
    <links>
        <embedded>...</embedded>
        <related>...</related>
        <mentioned>...</mentioned>
    </links>
</node>

<node>
    <title>Getting help</title>
    <text>
        <p>Having trouble? We’d like to help!</p>
        <ul class="simple">
            <li><p>Try the <a class="reference internal" href="contents.html#document-faq/index"><span class="doc">FAQ</span></a> – it’s got answers to many common questions.</p></li>
            <li><p>Looking for specific information? Try the <a class="reference internal" href="genindex.html"><span class="std std-ref">Index</span></a>, <a class="reference internal" href="py-modindex.html"><span class="std std-ref">Module Index</span></a> or
            the <a class="reference internal" href="contents.html#document-contents"><span class="doc">detailed table of contents</span></a>.</p></li>
            <li><p>Not found anything? See <a class="reference internal" href="contents.html#document-faq/help"><span class="doc">FAQ: Getting Help</span></a> for information on getting support
            and asking questions to the community.</p></li>
            <li><p>Report bugs with Django in our <a class="reference external" href="https://code.djangoproject.com/">ticket tracker</a>.</p></li>
        </ul>
    </text>
    <summary>...</summary>
    <definitions>...</definitions>
    <procedures>...</procedures>
    <keywords>...</keywords>
    <flashcards>...</flashcards>
    <links>
        <embedded>...</embedded>
        <related>...</related>
        <mentioned>...</mentioned>
    </links>
</node>
```

So create a lot of nodes and