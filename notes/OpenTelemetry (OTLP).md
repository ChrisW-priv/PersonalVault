---
title: Spans and Traces in OpenTelemetry (OTLP)
description: Description of a protocol allowing better observability.
date: 2025-05-06
tags: []
categories:
  - zettelkasten
draft: false
---

OpenTelemetry Protocol (OTLP) - Quick Notes

## What is OTLP?

OTLP is the native protocol used by OpenTelemetry to export telemetry data such as traces, metrics, and logs from instrumented applications to observability backends (e.g., Jaeger, Prometheus, Tempo, etc.).

## Key Characteristics

Open standard: Designed for interoperability and vendor neutrality.

Efficient: Uses Protocol Buffers (Protobuf) for compact, fast serialization.

Supports multiple data types: Traces, metrics, and logs.

Transport: Typically uses gRPC (default) or HTTP/JSON as alternative.

## Main Components

1. Producers (Instrumentation SDKs)

Libraries in your app that capture telemetry data and send it out.

Supports auto and manual instrumentation.

They can produce Spans or Traces etc. For the difference see also: [Spans and Traces in OpenTelemetry (OTLP)](Spans%20and%20Traces%20in%20OpenTelemetry%20(OTLP).md)

2. OTLP Exporters

Send telemetry data over the wire using OTLP.

Examples: OTLP gRPC Exporter, OTLP HTTP Exporter.

3. Collector (Optional but recommended)

Acts as a proxy or pipeline for telemetry data.

Receives OTLP data from exporters, processes it (e.g., sampling, filtering), and sends it to backends.

Modular and pluggable (receivers, processors, exporters).

4. Backends

Storage and visualization platforms (e.g., Jaeger, Grafana, New Relic).
