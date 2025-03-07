---
title: "uv as python build tool"
date:
  "{ date:YYYY-MM-DD }": 
description: ""
tags:
  - posts
categories: 
type: post
---

# Evaluating the Adoption of `uv` in Corporate Python Projects

## TLDR;

Switching from `poetry` to `uv` could really boost our Python projects. `uv` is
faster, simpler, and fits right into what we're doing. By using strategies like
multi-stage Docker builds , we can make sure the change is safe and easy.

## Limitations of `poetry`

While `poetry` offers a comprehensive approach to dependency management and project configuration, it has notable drawbacks:

- **Performance Bottlenecks**: Dependency resolution and installation processes in `poetry` can be slow, hindering rapid development cycles.
- **Manual Interventions**: Frequent manual adjustments are required to resolve dependency conflicts or manage environment inconsistencies, leading to potential delays.

## Advantages of `uv`

`uv` emerges as a compelling alternative, addressing many of the limitations associated with `poetry`:

1. **Enhanced Performance**: Written in Rust, `uv` offers significantly faster dependency resolution and installation compared to traditional tools like `pip` and `poetry`. Benchmarks indicate that `uv` can be 8-10 times faster than `pip` and `pip-tools` without caching, and 80-115 times faster with a warm cache. 
2. **Unified Toolchain**: `uv` consolidates functionalities such as virtual environment creation, package installation, and dependency resolution into a single tool, simplifying the development workflow.
3. **Seamless Integration**: Designed as a drop-in replacement for `pip` and `pip-tools`, `uv` ensures compatibility with existing projects with minimal configuration changes.

## No risk in using `uv`

### Multi-Stage Docker Builds

*Example Dockerfile:*

```Dockerfile
# Stage 1: Build
FROM ghcr.io/astral-sh/uv@sha256:0a5c60f84655a2d331b5280955abb0104dbea7188d7bb4749bbb13a1bbd90119 AS base

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    UV_COMPILE_BYTECODE=1 \
    UV_PYTHON_PREFERENCE='only-system'

COPY pyproject.toml .

RUN uv sync --no-dev

# Stage 2: Production
FROM python:3.13-slim@sha256:f41a75c9cee9391c09e0139f7b49d4b1fbb119944ec740ecce4040626dc07bed AS production

COPY --from=base /app /app

# Additional configurations and CMD
```

In this configuration:

- **Deterministic Builds**: By referencing specific image digests (e.g., `sha256:...`), we ensure that the exact same base images are used in every build, mitigating the risk of introducing vulnerabilities from updated images.

- **Optimized Layers**: Dependencies are installed in the build stage (`base`) and only the necessary artifacts are copied to the production stage, resulting in a leaner and more secure final image.

### Astral's Commitment

Astral, the company behind `uv`, is dedicated to keeping it up-to-date and reliable. They regularly maintain and update the tool, showing their strong commitment.

### Open Source Advantage

`uv` is open source, which means anyone can contribute to its development. This openness helps keep the tool transparent and encourages community support.

### Proven and Trusted

`uv` is already packed with features and has been tested in many projects. Its wide use means there's a big community backing it, reducing the risk of it being abandoned.
