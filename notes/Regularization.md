---
title: Regularization
description: The process of adding constraints to a learning algorithm or model to reduce itscomplexity, thereby decreasing the risk of overfitting.
date: 2025-06-11
tags: []
categories:
  - zettelkasten
draft: false
---

## Definition of Regularization

**Regularization** is the process of adding constraints to a learning algorithm
or model to reduce its complexity, thereby decreasing the risk of overfitting.
Overfitting occurs when a model fits the training data too closely, capturing
noise and specific patterns that do not generalize well to new, unseen data.

Key Points:

- **Degrees of Freedom:** Each model parameter represents a degree of freedom.
More parameters allow the model to adapt more flexibly to the training data but
increase the risk of fitting noise.
- **Constraint Mechanisms:** By limiting parameter values or relationships, you
effectively reduce the model’s flexibility.
    - **Hard Constraints:** Force certain parameters to fixed values (e.g., setting $\theta_1 = 0$).
    - **Soft Constraints:** Penalize large parameter values through additional terms in the cost function (e.g., L1 or L2 penalties).
- **Bias–Variance Trade-off:** Regularization shifts the balance toward higher bias (simpler models) and lower variance (more stable predictions), improving generalization.

Common Regularization Techniques:

* **L2 Regularization (Ridge):** Adds a penalty proportional to the square of parameter magnitudes: $\lambda \sum_i \theta_i^2$.
* **L1 Regularization (Lasso):** Adds a penalty proportional to the absolute values of parameters: $\lambda \sum_i |\theta_i|$, promoting sparsity.
* **Elastic Net:** Combines L1 and L2 penalties.

### Example: Constraining a Linear Model

Consider our simple linear regression model:

$$
\hat y = \theta_0 + \theta_1 x
$$

- **Unconstrained Model:** Both $\theta_0$ and $\theta_1$ are free, giving two degrees of freedom. The algorithm adjusts both to minimize prediction error.
- **Hard Constraint ($\theta_1 = 0$):**
    - Now the model reduces to $\hat y = \theta_0$.
    - Only one degree of freedom remains: the algorithm can only shift the horizontal line up or down.
    - Optimal $\theta_0$ becomes the mean of the training targets.
- **Soft Constraint (Keep $\theta_1$ Small):**
    - Add a penalty term to the cost function:

$$
J(\theta_0, \theta_1) = \frac{1}{m}\sum_{i=1}^m (\hat y^{(i)} - y^{(i)})^2 + \lambda\,\theta_1^2
$$

  - Here, $\lambda$ (“regularization strength”) controls the trade-off:
    - $\lambda = 0$ yields the unconstrained case.
    - Very large $\lambda$ forces $\theta_1$ toward 0 (similar to the hard constraint).
  - For intermediate $\lambda$, the model has between one and two effective degrees of freedom, creating a simpler line with reduced slope magnitude.

**Visual Illustration:**

* **Unconstrained:** Steeper line that closely fits the data.
* **High $\lambda$:** Flatter line, closer to the mean.
* **Moderate $\lambda$:** Balance between fit and simplicity.
