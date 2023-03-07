# Bayes theorem
## Definition
Bayes Rule describes the probability of an event, based on prior knowledge of conditions that might be related to the event.
With Bayesian probability interpretation, the theorem expresses how a degree of belief, expressed as a probability, should rationally change to account for the availability of related evidence. Bayesian inference is fundamental to Bayesian statistics, being considered "to the theory of probability what Pythagoras's theorem is to geometry."

## Notation
$$P(A\mid B)= \frac{P(A)\times P(B\mid A)}{P(B)} = \frac{P(A \cap B)}{P(B)}$$
- $P(A\mid B)$ is a conditional probability: the probability of event $A$ occurring given that $B$ is true. It is also called the posterior probability of $A$ given $B$.
- $P(B\mid A)$ is also a conditional probability: the probability of event $B$ occurring given that $A$ is true.
- $P(A)$ and $P(B)$ are the probabilities of observing $A$ and $B$ respectively without any conditions; They are known as the marginal probability or prior probability.

## Intuition
As it can be difficult to just *remember* the theorem there are multiple ways of how we can get this equation from visualizing problem and then generalizing.

It can also help to change the names of the variables to reflect true use of the theorem:
$$P(H\mid D)= \frac{P(H)\times P(D\mid H)}{P(D)}$$
- $P(H\mid D)$: the probability of hypothesis being true given observed data. It is also called the *posterior probability*.
- $P(D\mid H)$: the probability of seeing data if we assume that our hypothesis is true.
- $P(H)$: probability of our hypothesis being true.
- $P(D)$: probability of observing data on it's own.

Now we get something we can read as "How probable is our hypothesis given data if we know the probability of data occurring under our hypothesis and probability of our hypothesis ever occurring"

## Related to
[[Probability]]
[[Statistics]]
[[Conditional probability]]