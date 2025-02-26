---
title: "Cpp in Python"
date: 2025-02-14
description: ""
tags: 
  - "zettlekasten"
categories: []
---

To use a C++ function in Python, you can use Cython to create a Python extension module. Cython is a language that makes writing C extensions for the Python language as easy as Python itself.

Here's an example of how to do this:

1.  First, you'll need to install Cython if you don't already have it. You can do this by running the following command:

```cmd
pip install cython
```

2.  Next, you'll need to create a file containing the C++ code for the function you want to use in Python. Let's call this file `my_function.cpp`.
3.  Then, create a file called `setup.py` containing the following code:

```python
from distutils.core import setup
from Cython.Build import cythonize

setup(
  name="My Cython Extension",
  ext_modules=cythonize("my_function.cpp")
)
```

This file specifies the necessary information for building your Cython extension.

4.  Now, you can build the extension by running the following command:

```cmd
python setup.py build_ext
```

This will create a file called `my_function.so` (or `my_function.pyd` on Windows), which is the compiled Cython extension.

5.  Finally, you can use the C++ function in your Python code by importing the extension module:

```python
import my_function

my_function.my_cpp_function()
```

You can find more detailed instructions for using Cython to create Python extensions in the Cython documentation: [Cython documentation](https://cython.readthedocs.io/en/latest/src/userguide/wrapping_CPlusPlus.html)
