---
title: Spans and Traces in OpenTelemetry (OTLP)
description: Short comparison of spans vs traces in context of OpenTelemetry protocol
date: 2025-05-06
tags: []
categories:
  - zettelkasten
draft: false
---

## Trace

A trace represents the entire journey of a request or operation as it moves through various services.

Think of it as a tree or graph of spans — it's the overall context for a single execution path (like a user request to a web app that hits several microservices).

## Span

A span is a single unit of work within a trace.

It represents one operation (like an HTTP request, DB call, function execution).

Each span has metadata: name, start/end time, status, parent span (if any), attributes, etc.

Multiple spans make up a trace and are often nested (child spans within parent spans).
