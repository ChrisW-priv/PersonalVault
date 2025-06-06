---
title: "Machine Learning Algorithm Taxonomies"
description: ""
date: "2025-06-05"
tags: 
categories:
  - zettelkasten
draft: false
---

Types of Machine Learning Systems There are so many different types of Machine
Learning systems that it is useful to classify them in broad categories based
on: 

- Whether or not they are trained with human supervision (supervised,
unsupervised, semi-supervised, and Reinforcement Learning) 
- Whether or not they can learn incrementally on the fly (online versus batch
learning) 
- Whether they work by simply comparing new data points to known data points, or
instead detect patterns in the training data and build a predictive model, much
like scientists do (instance-based versus model-based learning) 

These criteria are not exclusive; you can combine them in any way you like. For
example, a state-of-the-art spam filter may learn on the fly using a deep neural
network model trained using examples of spam and ham; this makes it an online,
model-based, supervised learning system. Let’s look at each of these criteria a
bit more closely.

### Supervised/Unsupervised

In supervised learning, the training data you feed to the algorithm includes the
desired solutions, called labels. 

Unsupervised learning In unsupervised learning, as you might guess, the training
data is unlabeled (Figure 1-7). The system tries to learn without a teacher.