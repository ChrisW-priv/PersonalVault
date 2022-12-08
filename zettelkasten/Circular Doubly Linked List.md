# Circular Doubly Linked List
## Definition
An extension od [[Doubly Linked List]] also called Doubly Linked Ring.

## Notation
```mermaid
flowchart LR
    start --> A 
    A -->|next| B -->|next| C -->|next| D-->|next| A
	D -->|prev| C -->|prev| B -->|prev| A-->|prev| D
```

## Code
> [!note]
> In general it'll be easier to implement this using iterators + one extra node that will not be treated as Read-Write node. Instead it'll be used to define begin() and end() iterators.
```mermaid
flowchart LR
    start --> A -->|next| A-->|prev| A
```
Such that iterator `end` will be equal to `A` and `begin` will be `A->next`.

#TODO  create this class and add it to github + add link here