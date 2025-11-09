---
title: Improve Django RBAC control
description: ""
date: 2025-05-14
tags:
  - project
important: true
status: done
---

## Action Items

- [x] make content access controll fully separate app.
- [x] implement the enforcer and adapter in better ways then they are now
- [x] make this pip installable
- [ ] learn how to deploy via functions
    - It makes sense for us to deploy a simple, smaller function that will just
    respond with "yes/no" permission or signed urls if data is in some GCS etc.
