---
title: Add venv to Jupyter Notebook
description: Adding installed packages from virtual environment to be available in Jupyter Notebook
date: 2025-04-01
tags:
  - jupyter
  - python
categories:
  - zettelkasten
draft: false
---

Jupyter Notebook makes sure that the IPython kernel is available, but you have to manually add a kernel with a different version of Python or a virtual environment. First, make sure your environment is activated with conda activate myenv. Next, install ipykernel which provides the IPython kernel for Jupyter:

```bash
pip install --user ipykernel
```

Next you can add your virtual environment to Jupyter by typing:

```bash
python -m ipykernel install --user --name=.venv
```

This should print the following: `Installed kernelspec .venv in /home/user/.local/share/jupyter/kernels/.venv`

In this folder you will find a `kernel.json` file which should look the following way if you did everything correctly:

```json
{
 "argv": [
  "/home/chris/projects/nexus/.venv/bin/python3",
  "-Xfrozen_modules=off",
  "-m",
  "ipykernel_launcher",
  "-f",
  "{connection_file}"
 ],
 "display_name": ".venv",
 "language": "python",
 "metadata": {
  "debugger": true
 }
}
```

That’s all to it! Now you are able to choose the conda environment as a kernel in Jupyter. 
