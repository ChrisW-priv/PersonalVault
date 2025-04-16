---
title: Functional vs Non-Functional requirements
description: 
date: 2025-04-16
tags: []
categories:
  - zettelkasten
draft: false
---

| Type           | What it Answers            | Example                                           |
| -------------- | -------------------------- | ------------------------------------------------- |
| Functional     | What should the system do? | "User can reset password via email link."         |
| Non-Functional | How well should it do it?  | "Reset link must be delivered in under 1 minute." |

## Summary:

- Functional = Features -> What the system does.
- Non-Functional = Qualities -> How the system behaves under constraints or conditions.



## Functional Requirements (FR)

These describe **what the system should do** - the core features and behaviors of the software.

> “If you click this, what happens?”

### Examples:

- The system shall allow users to log in using their email and password.
- A customer can add items to the shopping cart.
- The app sends a confirmation email after a user registers.

#### Analogy (Restaurant):

Functional = What's on the **menu**. E.g., "Serve pizza", "Take online orders", "Accept credit cards".

## Non-Functional Requirements (NFR)

These describe **how the system performs**—its quality attributes.

> “How well does it do what it does?”

### Examples:

- The system should load the homepage within 2 seconds.
- The system must support 10,000 concurrent users.
- The application should have 99.99% uptime.
- The site must be mobile responsive.

### Analogy (Restaurant):

Non-functional = The **ambience and service**. E.g., "Serve food within 10 minutes", "Keep the place clean", "Maintain noise level below 50 dB".