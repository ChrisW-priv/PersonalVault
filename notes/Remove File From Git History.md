---
title: "Remove File From Git History"
date: "2025-03-14"
description: ""
tags:
  - zettlekasten
---

There are 2 cases:

- You want to remove the **tracking** of the file but keep it's history
- You want to remove the **history** of the file in the repo all together

## Remove tracking of the file

Use git rm.

If you want to remove the file from the **Git repository and the filesystem**, use:

```bash
git rm file1.txt
git commit -m "remove file1.txt"
```

If you want to remove the file **only from the Git repository** and **not** remove it from **the filesystem**, use:

```bash
git rm --cached file1.txt
git commit -m "remove file1.txt"
```

## Remove history of the file in the repo

I had a case of me committing file to the repo (.env with token inside) and I needed to delete it not only from current state, but also from the history.

I used:

```bash
git filter-branch --force --index-filter "git rm --cached --ignore-unmatch **.env" --prune-empty --tag-name-filter cat -- --all
```

And then, `git push --force`, because I already pushed it to remote. 

Caveats: this did rewrite the commits on **branches**, but did not delete the commits (commit files still in the `.git` folder, but not accessible on branch history).
This means that I could still access the token if I knew EXACTLY what commit id it had OR just used automated scripts on the `.git` directory files.

TODO: learn how to prune the "dangling" commits

TODO: I kept having error below. Learn what it means and how to fix it.
```bash
WARNING: git-filter-branch has a glut of gotchas generating mangled history
         rewrites.  Hit Ctrl-C before proceeding to abort, then use an
         alternative filtering tool such as 'git filter-repo'
         (https://github.com/newren/git-filter-repo/) instead.  See the
         filter-branch manual page for more details; to squelch this warning,
         set FILTER_BRANCH_SQUELCH_WARNING=1.
```