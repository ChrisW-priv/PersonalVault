---
title: Managing remote git repositories
description: Link to instructions on how to manage remote repos
date: 2025-03-30
tags:
  - git
categories:
  - zettelkasten
draft: false
---

## Key Operations

- **Get a Remote Url**: Use `git config --get remote.origin.url` to get remote repository url.
- **Adding a Remote**: Use `git remote add <name> <url>` to link your repository to a remote.
- **Changing a Remote's URL**: Use `git remote set-url <name> <new-url>` to update the URL of an existing remote.
- **Renaming a Remote**: Rename a remote with `git remote rename <old-name> <new-name>`.
- **Removing a Remote**: Remove a remote with `git remote remove <name>`.

For more details, visit [GitHub Docs - Managing Remote Repositories](https://docs.github.com/en/get-started/git-basics/managing-remote-repositories).

> [!Note]
> The `<name>` attribute is usually just `origin`

Assuming the name is indeed origin:

- **Adding a Remote**: Use `git remote add origin <url>` to link your repository to a remote.
- **Changing a Remote's URL**: Use `git remote set-url origin <new-url>` to update the URL of an existing remote.
- **Removing a Remote**: Remove a remote with `git remote remove origin`.
