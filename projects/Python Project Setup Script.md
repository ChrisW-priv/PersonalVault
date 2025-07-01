---
title: Python Project Scaffold Script
description: Script that would assist me in building the Python project that I want to do
date: 2025-03-27
tags:
  - project
important: false
status: todo
---

## Motivation

I suddenly have a ton of ideas where I want to just build and test the thing I
am interested in. Fastest way to do that is to make a script that will make the
start trivial. I am actually inspired by the npm tool, where just after some
basic choices I can get some nice scaffolded structure.

### Remarks

This is already kind of done by `uv` is this really necessary??

## Action Items

- [ ] Learn how to make a great tui
- [ ] Play around with npm init tool
- [ ] Define the steps and options that we will take into consideration
    - what build tool \[`uv`| `poetry`| `pip`\]
    - \[project | library\]
    - if project -> type: \[django-backend | CLI | jupyter\]
    - if library -> type: \[published ?\]
    - remote git? (maybe combine with n8n or github api?) -> if yes, pass a link, if link == "" then only the local git repo will be init.
- [ ] Define scaffolded structures
    - Implement all of the above options and define: what code analysis tools + default configurations
- [ ] Implement the scaffolded structures
- [ ] Publish the work for easy install

## Related work

I already tried once [link](https://github.com/ChrisW-priv/PythonProjectTemplate/tree/main).
While that was a failure, I can still make it work, just need some better standards.
Some of those standards are here [link](https://github.com/ChrisW-priv/python-library-template).
And I like how that feels, but I need more customizability like the ones in 
[Action Items](Python%20Project%20Setup%20Script.md#Action%20Items)

Maybe make the SHARED library a default? this way creating, testing and
maintaining code in small projects is WAY easier.
