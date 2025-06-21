---
title: "SOLID Principle"
description: ""
date: "2025-06-21"
tags: []
categories:
  - zettelkasten
draft: false
---

> Often Quoted, Rarely Practiced and even less often-ly understood

*SOLID* is an acronym that has:

- Single responsibility
- Open/Close
- Liskov substitution
- Interface Segregation
- Dependency Inversion

## Single responsibility

Class should do one thing and have only one reason to change.

For example: if you have a *UserService* class that does CRUD on the User entity but also does registry, login and email notifications

## Open/Close

Open for Extension,
Closed for Modification

## Liskov substitution

Children of a superclass (subclasses) should not change the behavior of the parent.

## Interface Segregation

There should be no "Catch all class" that captures the properties of all entities cuz, then, concrete subclasses may not implement that.

## Dependency Inversion

Depend on abstractions. Use polymorphism to decide concrete behavior later.