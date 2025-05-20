---
title: Using Acronyms in LATEX
description: Set of Rules to define and reference the acronyms we defined
date: 2025-05-20
tags:
  - latex
categories:
  - zettelkasten
draft: false
---

### Quick guide: acronyms & glossary entries in LaTeX

The most versatile way to manage both acronyms **and** general glossary terms is the **`glossaries`** package (or its lighter cousin **`acro`**). Below is a concise “recipe” that shows where to put each piece and how to cite items in your text.

---

#### 1. Preamble – load & configure the package

```latex
\usepackage[acronym]{glossaries}   % turn on acronym support
\makeglossaries                  % tells LaTeX to create auxiliary files
```

*(With `acro`, you would instead `\usepackage{acro}` and call `\DeclareAcronym`—syntax is very similar.)*

---

#### 2. Defining items

You usually keep all definitions **together** just after `\begin{document}` (or in an external `.tex` file you `\input{}`).

```latex
% ---------- Acronyms ----------
\newacronym{ai}{AI}{artificial intelligence}
\newacronym{ta}{$t_a$}{air temperature}
\newacronym[plural=GPUs, firstplural=graphics processing units (GPUs)]%
            {gpu}{GPU}{graphics processing unit}

% ---------- Regular glossary terms ----------
\newglossaryentry{tensor}{
  name        = tensor,
  description = {multidimensional array that generalises scalars, vectors and matrices}
}

\newglossaryentry{overfitting}{
  name        = overfitting,
  text        = overfitting,          % how it appears in running text
  description = {model that performs well on training data but poorly on unseen data}
}
```

**Tip:** if you place these in `glossary.tex`, keep your main file clean:

```latex
\begin{document}
\input{glossary}
```

---

#### 3. Referencing in the text

| Want to show…                          | Command          | Result (first / later use)        |
| -------------------------------------- | ---------------- | --------------------------------- |
| Full term + acronym, then acronym only | `\gls{ai}`       | artificial intelligence (AI) → AI |
| Only the acronym (even first time)     | `\acrshort{gpu}` | GPU                               |
| Only the full form                     | `\acrlong{gpu}`  | graphics processing unit          |
| Plural form                            | `\glspl{gpu}`    | GPUs                              |
| Glossary term with hyperlink           | `\gls{tensor}`   | tensor (linked)                   |
| Acronym with capital first letter      | `\Gls{ta}`       | Air temperature                   |
