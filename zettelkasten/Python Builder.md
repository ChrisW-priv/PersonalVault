---
title: Python Builder
date: 2025-02-25
description: Builder pattern for python
tags:
  - weekend_project_idea
categories: 
status: todo
---

Make a simple python builder class that will track the attributes of:

- Regular python `class`
- `dataclass`
- `pydantic.BaseModel` [link](https://docs.pydantic.dev/latest/api/base_model/)

Features I want:

- `set` method that accepts property name and value to set
	- on call to this method: raise exception if the property is not defined
- `__or__` method that will accept self and other builders
	- on call to this method: if the builder is for different class: raise exception
	- result of the call: new builder instance that inherits all attributes of
	`self` and all attributes of `other` that are not `None`, which is default. In
	case where both `self` and `other` have attributes not `None`: set the new
	builder value to the `other` value
- `build` method that will create instance of the class that the builder is set to track

I want to the implementation to be in a form of a class decorator, that will add `builder` method. 
That method will return a builder to the caller.

Example usage:

```python
@add_builder
class Foo:
    a: int
    b: str
	c: bool


foo_builder = Foo.builder()
foo_builder_a = foo_builder.set('a', 1)
foo_builder_b = foo_builder.set('b', "abc")
foo_builder_c = foo_builder.set('c', True)
foo_builder_err = foo_builder.set('d', True)  # should raise an error
foo_builder_b1 = foo_builder.set('b', "def")

foo_builder_ab = foo_builder_a | foo_builder_b  # foo_builder_ab has a=1, b='abc', c=None
foo_builder_b2 = foo_builder_b | foo_builder_b1  # foo_builder_b2 a=None, b='def', c=None
```
