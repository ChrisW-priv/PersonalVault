---
title: "Some tests generation prompt"
description: ""
date: "2025-09-12"
tags: 
categories:
  - zettelkasten
draft: false
---

I desperately need to create more tests for the @src/content_extraction/ module.
I already have some simple tests in @tests/ but I need more. Please note that
many of the modules process files which is really expensive, I want you to
create tests for each function and mock any behaviour that is expensive (but
then in the mocked cases I need you to create separate cases for each
posibility: return with success, return empty, raise error, etc.). First
function that starts the processing is the `process_file` in the
@src/content_extraction/file_handlers.py . I want you to mock the behaviour of
each lower level function and continue to test those functions with mocks for
their respective functions, untill you think all code has been covered. 