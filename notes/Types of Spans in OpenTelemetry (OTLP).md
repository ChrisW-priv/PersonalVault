---
title: Types of Spans in OpenTelemetry (OTLP)
description: Description of a purpose of each span type in OTLP
date: 2025-05-06
tags: []
categories:
  - zettelkasten
draft: false
---

Each kind helps identify how a span fits into a trace. Here are the main types:

---

1. SpanKind.CLIENT

Represents a request initiated by your service to another remote service.

Common for outgoing HTTP calls, database queries, gRPC client calls.

Example: Your app calls a REST API — the client span records that outbound request.

---

2. SpanKind.SERVER

Represents a span that handles an incoming request.

Used at the entry point of a service receiving external traffic.

Example: Your app receives an HTTP request — the server span records the handling of that request.

---

3. SpanKind.PRODUCER

Used when your service sends a message to a message broker (e.g., Kafka, RabbitMQ).

Marks the production of a message or event.

---

4. SpanKind.CONSUMER

Represents the receipt and processing of a message from a broker.

Complements PRODUCER.

---

5. SpanKind.INTERNAL

Default kind.

Used for internal operations within a process that don't fit client/server/messaging.

Example: Background tasks, in-process function calls, or custom operations.
