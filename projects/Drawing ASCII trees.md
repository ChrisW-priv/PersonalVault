---
title: Drawing ASCII trees
description: ""
date: 2025-04-04
tags:
  - project
important: false
status: todo
---
## What I want put into words:

- I want all tree leaves to be separated by at least 3 chars (one from the left, one from right and one for additional spacing)
- I want the branches that are not | to be shifted by one in the direction of the parent (or 2 in case of even spacing to the next node)
- I want the ability to have comments to the right of the tree (toggle this option)
- Ability to break tree in a smart manner to fit all text in the 120 max space.

## Examples of what I want

I want to build an ASCII drawing tool that will draw something like this:

```
              A                 # Comment
       /             \          # Comment
      B               I         # Comment
   /     \         /     \      # Comment
  C       F       J       M     # Comment
 / \     / \     / \     / \    # Comment
D   E   G   H   K   L   N   O   # Comment
```

So this is a binary tree... and for more children:

```
            E                   # Comment
     /             \            # Comment  
    D               F           # Comment     
 /  |  \     /   /  |  \   \    # Comment    
A   B   C   G   H   I   J   K   # Comment 
```

Or in case some nodes have no children

```
                           E              # Comment
     /           /       /   \   \   \    # Comment  
    D           F       J     K   L   M   # Comment     
 /  |  \     /  |  \                      # Comment
A   B   C   G   H   I                     # Comment 
```

or:

```
                        E               # Comment
     /       /       /     \   \   \    # Comment  
    D       F       G       K   L   M   # Comment     
 /  |  \         /  |  \                # Comment
A   B   C       H   I   J               # Comment 
```

Tree with some nodes having only one child (notice no shift compared to last)

```
                        E               # Comment
     /       /       /     \   \   \    # Comment  
    D       F       G       K   L   M   # Comment     
 /  |  \    |    /  |  \    |   |   |   # Comment
A   B   C   *   H   I   J   *   *   *   # Comment 
```

Unbalanced tree:

```
        I
       / \
      G   J
     / \
    E   H 
   / \ 
  D   F
 / \  
A   C
```

## Action Items

- [ ] implement
