---
title: Git features
description: Note from a talk by some git expert, list of mentioned things to be investigated
date: 2025-04-24
tags:
  - git
categories:
  - zettelkasten
draft: false
---

[Link to original video](https://www.youtube.com/watch?v=aolI_Rz0ZqY)
[Link to the video on the same topic part 2](https://www.youtube.com/watch?v=aolI_Rz0ZqY)

## Aliases

simple alias:

```sh
git config alias.staash 'git stash --all'
```

full shell scripts:

```sh
git config alias.bb !better-branch.sh
```

## Conditional Configs

Just like in the [multi-account git setup](multi-account%20git%20setup.md).

```ini
[includeIf "gitdir:~/projects/]
    path = ~/projects/.gitconfig
```

## Git blame

```sh
git blame
```

```sh
git blame -L
```

`git blame -L` blames portion of a file, for example

```sh
git blame -L 15,26 path/to/file
```

on the other hand:

```sh
git blame -w -C
```

will result in `git blame` ignoring whitespace and detect lines moved or copied in the same commit 
(or if you do: `-C -C -C` it will look for "moved" code fragments in ANY commits ever)

## Git log

```sh
git log -L 15,26:path/to/file
```

will give history of the selected section

```sh
git log -L :File:path/to/file
```

will try to find the history of the changes for the `File` identifier (like a function or class)

```sh
git log -S pattern -p
```

will do a search on the entire history of the repo to find that pattern (and history of changes to that)

## Git reflog

history of all operations (if HEAD is pointing to it, then there will be a history of that change, shown here)

## Git diff

```sh
git diff --word-diff
```

will show which words in a line changed, not entire lines

## Signing commits

he mentioned we can "sign commits" with ssh not gpg but I dunno what commit signing even is so to be researched.
plus there is option to sign pushes too (but neither gitlab nor github support it yet)

## Git maintenance

git maintenance start will setup some incremental mode plus will autorun some scripts (?)

again, I have no idea what even it is so todo

## Git graph

some fun one as well, and there is `commit-graph` now that saves the cache and allows for incremental run

## Fsmonitor

so the normal mode for git to detect changes is to compare the "expected" file state with actual file state, which for large number of files is expensive.
Fs monitor will watch for those changes as a deamon process and will *know* if the files were changed or not (because it will save all the changes from the os signals)

## Hooks

### Commiting

- pre-commit
- prepare-commit-msg
- commit-msg
- post-commit

### Rewriting

- pre-rebase
- post-rewrite

### Merging

- pre-merge-commit
- post-merge

### Switching/Pushing

- post-checkout
- reference-transaction
- pre-push

## Attributes

Perform certain operation based on a file extension.
in the part 2: there is a suggestion to use exif tool too see what attrs of image file changed not just "it changed"

## Smudge and clean

![](attachments/Pasted%20image%2020250425125932.png)

## Fixup commits

you can do fixup to a commit and then do `rebase --autosquash` that will then modify past commits and redo all the changes etc.

## Rebasing stacks

rebasing the stacked changes such that it then updates all of the refs in the other stacks

## Worktrees!
