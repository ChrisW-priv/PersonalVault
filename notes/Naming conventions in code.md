---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Naming conventions in code
---

Part of [Code quality](Code%20quality)

This note is inspired by video by CodeAesthetic![here](https://www.youtube.com/watch?v=-J3wNP6u5YU)

He begins with a quote:

```quote
There are only tho hard things in computer science: cache invalidation and naming things.
- Phil Karlton
```

Main idea in his video is: you can get 80% of the way by "avoiding bad patterns".

Main patterns to avoid:

- Single letter variables. (I disagree for small scope names or convention like 'i' for loops)
- Abbreviations in general
- Forcing future readers to know the context code has been built in
- Don't put a type in the name, use types for it
- Don't put type to a type ("I" prefix in C##)
- Do not use "Base" or "Abstract" to name classes. If you need good name for parent class but cant find it, rename the child instead and "over-specify" (example: if you have a truck and want to generalise it, use "Truck" and "TrailerTruck" instead of "BaseTruck" and "Truck")
- Don't create "Utils" or "Helper" code bundles. It maybe helpful to use create a specific classes and move functions to operate on that class.

Use:

- units in your variables and function arguments
- Proper type to enforce proper units (example: TimeSpan delay, and to get seconds you need delay.TotalSeconds)
