---
title: "Challenges of Machine Learning"
description: ""
date: "2025-06-10"
tags: 
categories:
  - zettelkasten
draft: false
---

Note from: [Hands-On Machine Learning with Scikit-Lear - Aurelien Geron](../extra/Hands-On%20Machine%20Learning%20with%20Scikit-Lear%20-%20Aurelien%20Geron.pdf)

In short, since your main task is to select a learning algorithm and train it on
some data, the two things that can go wrong are **bad algorithm** or **bad
data**, or both. Let’s start with examples of bad data.

## Bad Data

### Not enough data

Based on some paper mentioned here:
[Hands-On Machine Learning with Scikit-Lear - Aurelien Geron, page 50](extra/Hands-On%20Machine%20Learning%20with%20Scikit-Lear%20-%20Aurelien%20Geron.pdf#page=50&annotation=3117R)
Given large volume of data, even simplistic models can perform well enough for a
task at hand.

### Training data is not representative

If we want to generalize, we have to have representative data that we can
generalize to. Outliers, or results of [Sampling Bias](Sampling%20Bias) fall
into this category.

### Poor training data quality

Data that contains noise or errors cannot build a good model that we can use.

- If some instances are clearly outliers, it may help to simply discard them or try to fix the errors manually.
- If some instances are missing a few features (e.g., 5% of your customers did not specify their age), you must decide whether you want to ignore this attribute altogether, ignore these instances, fill in the missing values (e.g., with the median age), or train one model with the feature and one model without it, and so on.

### Irrelevant Features

As the saying goes: garbage in, garbage out. Your system will only be capable of
learning if the training data contains enough relevant features and not too many
irrelevant ones. A critical part of the success of a Machine Learning project is
coming up with a good set of features to train on. This process, called feature
engineering, involves:

- Feature selection: selecting the most useful features to train on among
existing features.
- Feature extraction: combining existing features to produce a more useful one
(as we saw earlier, dimensionality reduction algorithms can help).
- Creating new features by gathering new data.

### Overfitting to training data

Model fails to generalize well

