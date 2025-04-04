---
title: "ECOTE tree follow rules"
description: ""
date: "2025-04-04"
tags: []
categories:
  - zettelkasten
draft: false
---

This note is a rendered set of rules for [ECOTE](../projects/ECOTE/ECOTE.md)

## Functions

### Null-able(n)

- $\epsilon$ node: **true**

```mermaid
flowchart TD
    A(($$\epsilon$$))
```

- non-$\epsilon$ node: **false**

```mermaid
flowchart TD
    A((a))
```

- **or** node: null-able(c1) **or** null-able(c2)

```mermaid
flowchart TD
    A(("|"))
    B((c1))
    C((c2))
    A --> B
    A --> C
```

- **concat** node: null-able(c1) **and** null-able(c2)

```mermaid
flowchart TD
    A(($$\cdot$$))
    B((c1))
    C((c2))
    A --> B
    A --> C
```

- **closure** node: **true**

```mermaid
flowchart TD
    A((\*))
    B((c1))
    A --> B
```

### first(n)

- $\epsilon$ node at $i$ position: $\emptyset$

```mermaid
flowchart TD
    A(($$\epsilon$$))
```

- non-$\epsilon$ node at $i$ position: $i$

```mermaid
flowchart TD
    A((a))
```

- **or** node: first(c1) $\cup$ first(c2)

```mermaid
flowchart TD
    A(("|"))
    B((c1))
    C((c2))
    A --> B
    A --> C
```

- **concat** node:

if nullable(c1):
    first(c1) $\cup$ first(c2)
else:
    first(c1)

```mermaid
flowchart TD
    A(($$\cdot$$))
    B((c1))
    C((c2))
    A --> B
    A --> C
```

- **closure** node:

first(c1)

```mermaid
flowchart TD
    A((\*))
    B((c1))
    A --> B
```
### last(n)

- $\epsilon$ node at $i$ position: $\emptyset$

```mermaid
flowchart TD
    A(($$\epsilon$$))
```

- non-$\epsilon$ node at $i$ position: $i$

```mermaid
flowchart TD
    A((a))
```

- **or** node: last(c1) $\cup$ last(c2)

```mermaid
flowchart TD
    A(("|"))
    B((c1))
    C((c2))
    A --> B
    A --> C
```

- **concat** node:

if nullable(c2):
    last(c1) $\cup$ last(c2)
else:
    last(c2)

```mermaid
flowchart TD
    A(($$\cdot$$))
    B((c1))
    C((c2))
    A --> B
    A --> C
```

- **closure** node:

last(c1)

```mermaid
flowchart TD
    A((\*))
    B((c1))
    A --> B
```
