---
title: multi-account git setup
description: Complete list of instructions to setup git with multiple accounts
date: 2025-03-30
tags:
  - git
categories:
  - zettelkasten
draft: false
---

Basic configuration assumptions:

- You have multiple git credentials sources
    - Personal account to Github/Gitlab
    - Professional account
    - Research account 
- You separate your work by folders
- You keep fighting against git configuration instead of using the full power of VCS

## Overview

We will have 2 folders: `projects` and `work`. Folder `projects` will contain
all personal projects that you may have. Folder `work` will be split more into
subfolders like `company1`, `university1` etc. Then, when you go to
`work/university1` and do any git command, git will use config specific to
`university1`, including the authentication and username + email.
We will do this by having `.gitconfig` files in each subfolder and using ssh 
key for all accounts. We will then, configure git + ssh to switch the config
between the users currently logged in, depending on the folder we are working
in.

## SSH Key setup

### Generate keys

Generate unique SSH keys for each account:

```sh
ssh-keygen -t ed25519 -C "foo@example.com" -f ~/.ssh/id_ed25519_key_name
```

Add each SSH key to the SSH agent for automatic authentication:

Start the SSH agent:

```sh
eval "$(ssh-agent -s)"
```

Add your keys:

```sh
ssh-add ~/.ssh/id_ed25519_key_name
```

### Add SSH Keys to Git Services

Copy the SSH key to your clipboard:

```sh
cat ~/.ssh/id_ed25519_key_name.pub
```

   - Add the key to your GitHub account via Settings > SSH and GPG keys.
   - Add the key to your GitLab account via Profile Settings > SSH Keys.

### Set Up SSH Config (`~/.ssh/config`)

The `~/.ssh/config` file tells SSH which key to use for each host.

1. Open or create `~/.ssh/config`:

```sh
vim ~/.ssh/config
```

2. Add the following:

```ini
Host github.com:username
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_ed25519_key_name
```

Example:

```ini
Host github.com:ChrisW-priv
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_priv_github
```

### Github Host Key to `known_hosts`

1. Run:

```sh
ssh-keyscan gitlab.com >> ~/.ssh/known_hosts
ssh-keyscan github.com >> ~/.ssh/known_hosts
```

## Set Up Git Configuration with Directory-Specific Settings

Use the `includeIf` directive to load separate Git configurations for different directories.
This allows for different user names/emails per repo.

1. Global `.gitconfig` (typically located at `~/.gitconfig`):
   This file will include configurations for specific directories like work (`~/work/uni`) and personal (`~/projects`).

Example of global `~/.gitconfig`:

```ini
[includeIf "gitdir:~/work/axpl/"]
   path = ~/work/uni/.gitconfig
```

> [!Note]
> There is a trailing slash `/` in the name of `includeIf`

2. Work-Specific Git Config (`~/work/uni/.gitconfig`):
   This will be applied when you are working in the `~/work/uni` directory.

```ini
[user]
name = ...
email = ...
[core]
sshCommand = "ssh -i ~/.ssh/id_ed25519_key_name -F /dev/null"
```

3. Personal-Specific Git Config (`~/projects/.gitconfig`):
   This will be applied when you are working in the `~/projects` directory.

```ini
[user]
name = ...
email = ...
[core]
sshCommand = "ssh -i ~/.ssh/id_ed25519_priv_github -F /dev/null"
```

## Check SSH Connection and Git Configurations

After setting everything up, ensure the SSH keys are being used correctly:

1. Test SSH Connection to GitHub:

```sh
ssh -T git@github.com
```

And that should print your account name that is configured for the folder you
run this from!
