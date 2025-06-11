---
title: Why use Machine Learning
description: 
date: 2025-06-05
tags: []
categories:
  - zettelkasten
draft: false
---

Note from: [Hands-On Machine Learning with Scikit-Lear - Aurelien Geron](../extra/Hands-On%20Machine%20Learning%20with%20Scikit-Lear%20-%20Aurelien%20Geron.pdf)

Using Machine Learning is often done as an optimization step of the traditional
programming techniques. Example of spam filter:

1. First you would look at what spam typically looks like. You might notice that
some words or phrases (such as “4U,” “credit card,” “free,” and “amazing”) tend
to come up a lot in the subject. Perhaps you would also notice a few other
patterns in the sender’s name, the email’s body, and so on.
2. You would write a detection algorithm for each of the patterns that you
noticed, and your program would flag emails as spam if a number of these
patterns are detected. 
3. You would test your program, and repeat steps 1 and 2 until it is good
enough.

![](attachments/Pasted%20image%2020250605161647.png)

But for a non trivial problems, you will get long list of complex rules. That is
hard to maintain (update, compare versions).

In contrast, a spam filter based on Machine Learning techniques automatically
learns which words and phrases are good predictors of spam by detecting
unusually frequent patterns of words in the spam examples compared to the ham
examples (Figure 1-2). The program is much shorter, easier to maintain, and most
likely more accurate.

![](attachments/Pasted%20image%2020250605162002.png)

A spam filter based on Machine Learning techniques automatically notices that
“For U” has become unusually frequent in spam flagged by users, and it starts
flagging them without your intervention (Figure 1-3).

![](attachments/Pasted%20image%2020250605162132.png)
