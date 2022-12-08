# Doubly Linked List
## Definition
An extension of [[Singly Linked List]]. Difference is that each node holds `data`, `next` pointer AND `prev` pointer. This makes any algorithm modifying the doubly linked list MUCH easier than in singly linked list.

## Notation
```mermaid
graph LR
    head --> A -->|next| B -->|next| C -->|next| D
	D -->|prev| C -->|prev| B -->|prev| A
```


## Code
#TODO  create this class and add it to github + add link here