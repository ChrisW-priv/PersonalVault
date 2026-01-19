---
title: "Requirement Specification Levels"
description: ""
date: "2025-10-20"
tags: 
categories:
  - zettelkasten
draft: false
---
There is an Actual RFC for a standardized use of Must, Should, May etc.

It can be found here: [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119).

They mention that if you want to use it you should have this at the top of the
document:

    The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL
    NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED",  "MAY", and
    "OPTIONAL" in this document are to be interpreted as described in
    [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119).

## Summary

[1](https://datatracker.ietf.org/doc/html/rfc2119#section-1). MUST   This word, or the terms "REQUIRED" or "SHALL", mean that the
   definition is an absolute requirement of the specification.

[2](https://datatracker.ietf.org/doc/html/rfc2119#section-2). MUST NOT   This phrase, or the phrase "SHALL NOT", mean that the
   definition is an absolute prohibition of the specification.

[3](https://datatracker.ietf.org/doc/html/rfc2119#section-3). SHOULD   This word, or the adjective "RECOMMENDED", mean that there
   may exist valid reasons in particular circumstances to ignore a
   particular item, but the full implications must be understood and
   carefully weighed before choosing a different course.

[4](https://datatracker.ietf.org/doc/html/rfc2119#section-4). SHOULD NOT   This phrase, or the phrase "NOT RECOMMENDED" mean that
   there may exist valid reasons in particular circumstances when the
   particular behavior is acceptable or even useful, but the full
   implications should be understood and the case carefully weighed
   before implementing any behavior described with this label.

[5](https://datatracker.ietf.org/doc/html/rfc2119#section-5). MAY   This word, or the adjective "OPTIONAL", mean that an item is
   truly optional.  One vendor may choose to include the item because a
   particular marketplace requires it or because the vendor feels that
   it enhances the product while another vendor may omit the same item.
   An implementation which does not include a particular option MUST be
   prepared to interoperate with another implementation which does
   include the option, though perhaps with reduced functionality. In the
   same vein an implementation which does include a particular option
   MUST be prepared to interoperate with another implementation which
   does not include the option (except, of course, for the feature the
   option provides.)