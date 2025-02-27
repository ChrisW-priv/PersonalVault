---
title: "Rynek Energii w Polsce"
date: 2025-02-27
description: ""
tags: 
  - "zettlekasten"
categories: []
---

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

