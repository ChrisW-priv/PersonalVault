---
categories:
- zettelkasten
date: 2025-02-14
description: No description provided.
tags: []
title: Makefile example
---

```make
CXX = clang
CXXFLAGS = -Wall -std=c++20
DEBUG_FLAGS = -g -O0
PERF_FLAGS = -O3 -march=native

SOURCES = main.cpp foo.cpp bar.cpp
OBJECTS = $(SOURCES:.cpp=.o)

TARGET = app

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(OBJECTS) -o $(TARGET)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

debug: CXXFLAGS += $(DEBUG_FLAGS)
debug: $(TARGET)

perf: CXXFLAGS += $(PERF_FLAGS)
perf: $(TARGET)

test: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(OBJECTS) $(TARGET)
```

Then to build:

```cmd
make
make test
make debug
make perf

```
