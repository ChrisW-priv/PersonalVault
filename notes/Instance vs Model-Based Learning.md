---
title: "Instance vs Model-Based Learning"
description: ""
date: "2025-06-10"
tags: 
categories:
  - zettelkasten
draft: false
---

Note from: [Hands-On Machine Learning with Scikit-Lear - Aurelien Geron](../extra/Hands-On%20Machine%20Learning%20with%20Scikit-Lear%20-%20Aurelien%20Geron.pdf)

## TL;DR

* **Instance-based** directly uses nearby examples: quick setup, but can be noisy and depends heavily on local examples.
* **Model-based** captures a global trend: more robust extrapolation, but requires choosing and fitting a model.

## Longer

### Instance-Based Learning

**Definition:**
Instance-based learning memorizes the training examples and makes predictions for new instances by comparing them to stored examples using a similarity measure.

* **Storage:** Keeps all (or a subset of) training data in memory.
* **Similarity Measure:** Defines how "close" or "similar" two instances are (e.g., Euclidean distance, cosine similarity, shared features).
* **Prediction:** For a new point, find the most similar stored instance(s) and use their labels or values to predict.

**Pros:**

* Simple to implement
* Adapts quickly to new data (no retraining required)

**Cons:**

* Prediction can be slow if dataset is large
* Requires a good similarity metric
* Sensitive to noise and irrelevant features

**Common Algorithms:**

* k-Nearest Neighbors (k-NN)
* Kernel density estimation (for probabilistic estimates)

### Model-Based Learning

**Definition:**
Model-based learning builds a compact model (parameterized function) that describes the relationship between inputs and outputs, then uses that model to make predictions.

* **Model Selection:** Choose a family of functions (e.g., linear functions, decision trees, neural networks).
* **Training:** Optimize the model’s parameters to fit the training data according to a cost or utility function.
* **Prediction:** Apply the learned function to new inputs.

**Pros:**

* Fast predictions once the model is trained
* Can generalize well if the model family is appropriate
* Often more interpretable (e.g., coefficients in linear regression)

**Cons:**

* May require retraining when new data arrives
* Risk of underfitting or overfitting if the model is too simple or too complex
* Training can be computationally expensive

**Common Algorithms:**

* Linear and logistic regression
* Support vector machines (SVM)
* Neural networks
* Decision trees and ensemble methods (e.g., random forests)
