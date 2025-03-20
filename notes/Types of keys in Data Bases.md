---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Types of keys in Data Bases
---

Types of keys that are present in data bases:

 - Primary
 - Foreign
 - Candidate
 - Super
 - Alternate
 - Surrogate
 - Natural
 - Simple
 - Composite/Compound
 - Inteligent

## Primary key

 - Unique identifier
 - Highly stable

## Candidate key

 - Key that could be a primary key

## Super key

Super key is a key composed by multiple attributes, but can and should be reduced to use less components. 

## Alternate key

 - A unique key other than primary key. value of this key cannot be inserted twice to the table

## Foreign key

 - value that is value present in other table (this other value is usually primary key)

## Surrogate key

Key that is used as a replacement for some other value, and only have meaning in a context of the data base they are used in.

In practice it's usually "ID" field that is used to uniquely represent the value in a row.

## Natural key

This key is what surrogate key usually refers to.

## Simple key

Primary key that is build by single attribute

## Compound/Composite Key

Primary key that is built by multiple attributes

## Inteligent key

Type of Natural key

Is a combination of multiple parts each conveying some meaning

Risk of using the inteligent key is that people might be tempted to use those properties to extract data from those which is not what designer intended. What if a format changes?

Situation when This type of key is ok is when the key is stable ie. will never change.