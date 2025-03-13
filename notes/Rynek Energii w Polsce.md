---
title: Rynek Energii w Polsce
date: 2025-02-27
description: ""
tags: 
categories: 
draft: true
---
[Batteries Project](../projects/Batteries%20Project.md)

Uproszczony widok na rynek energii w Polsce:

```mermaid
flowchart-elk LR
  D[Giełda]
  A[Producent]
  B[Odbiorca]
  C[Dystrybucja]
  E[Sprzedawca]

  A -->|Przekazuje| C
  C -->|Dostarcza| B
  D <-->|Sprzedaje| A
  E -->|Rejestruje odbiorcę| C
  D <-->|Kupuje| E
  E -->|Sprzedaje| B;
```

## Giełda

Giełda sama w sobie ma 3 główne rynki:

1. Capacity
2. Energii elektrycznej
    1. Forwards (Year, Quarter, Month, Week)
    2. Day ahead
    3. Intra day
    4. Bilansujący
3. Usług bilansujących
    1. pierwotna
    2. wtórna
    3. trójna
