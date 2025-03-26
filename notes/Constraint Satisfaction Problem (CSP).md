---
title: Constraint Satisfaction Problem (CSP)
description: A problem where a we need to find a solution that satisfies a set of constraints
date: 2025-03-26
tags: 
categories:
  - zettelkasten
---

## Practical application

It is a common solution to solve CSP with an [SAT solver](SAT%20solver) (Boolean Satisfiability).
Process usually requires encoding of CSP into SAT problem.
Example of SAT will be MiniSat, Z3, Glucose or Lingeling + others
The benefit of SAT include ability to handle large, complex problems, support
for parallel processing etc.

## Examples

- Sudoku
- Timetables (scheduling courses)
- Map coloring

## Formal definition

A triple **<X, D, C>** where:

- **X = {X₁, X₂, ..., Xₙ}** is a set of variables
- **D = {D₁, D₂, ..., Dₙ}** is a set of domains, where each *Dᵢ* is the domain of variable *Xᵢ*
- **C = {C₁, C₂, ..., Cₘ}** is a set of constraints, where each *Cⱼ* is a constraint over some subset of variables in *X*

### Problem Goal

The goal is to find an assignment of values to variables in *X* that satisfies all constraints in *C*

### Solution Definition

A solution to a CSP is a complete assignment of values to variables that satisfies all constraints
