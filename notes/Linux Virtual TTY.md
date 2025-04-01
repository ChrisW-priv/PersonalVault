---
title: Linux Virtual TTY
description: Opening terminal when display broke on linux
date: 2025-04-01
tags:
  - linux
categories:
  - zettelkasten
draft: false
---

## Glossary Of Acronyms

**TTY (Teletypewriter)** - A virtual terminal in Linux that provides a text-based interface. Accessible using **`CTRL+ALT+F1`** to **`CTRL+ALT+F6`**.

**VC (Virtual Console)** - A session running a shell in a text-based interface. Linux typically provides **six virtual consoles**.

**DM (Display Manager)** - A service that manages graphical login sessions. Examples include **SDDM, GDM, LightDM, and XDM**.

**WM (Window Manager)** - Software that controls window placement and appearance. Examples include **i3, Openbox, and Xmonad**.

**Xorg (X Server)** - A display server that manages graphics rendering for window managers and desktop environments.

**SDDM (Simple Desktop Display Manager)** - A lightweight **display manager** often used with KDE and i3.

**startx** - A command to start an **X session** manually from a TTY.

## Procedures

### Switching Between Virtual Consoles (TTYs)

- `CTRL+ALT+F1` to `CTRL+ALT+F6`: Switch between **text-based virtual consoles**.
- `CTRL+ALT+F2`: Switch back to the **graphical session** (where SDDM is running).

### Checking Available TTYs

Run:

```bash
systemctl list-units --type=service | grep getty
```

and get

```bash
  getty@tty3.service                                    loaded active running Getty on tty3
  getty@tty4.service                                    loaded active running Getty on tty4
  getty@tty5.service                                    loaded active running Getty on tty5
  getty@tty6.service                                    loaded active running Getty on tty6
```

By default, you'll see /dev/tty1 to /dev/tty6 (for text consoles) and /dev/tty7 (or /dev/tty2 for the GUI session).

### Configuring More TTYs

Step 1: Edit the getty Service; Open the systemd getty configuration file:

```bash
sudo vim /etc/systemd/logind.conf
```

Look for this line (uncomment it if necessary) 

```ini
NAutoVTs=6
```

Increase the number of virtual terminals, e.g., `NAutoVTs=12` for 12 TTYs.

### Starting TTYs manually

To start them immediately, run:

```bash
sudo systemctl start getty@tty7.service
```

### Checking Which Display Manager is Running

Run the following command:

```sh
systemctl status display-manager
```

This will show output like:

```
● sddm.service - Simple Desktop Display Manager
```

which means **SDDM is running**.

### Starting a Second X Session on TTY3

#### (Without A Display Manager, Manually Using startx)

1. Switch to **TTY3** using `CTRL+ALT+F3`.
2. Log in with your username.
3. Start X and i3 manually:

```sh
export DISPLAY=:1
startx /usr/bin/i3 -- :1 vt3
```

### Exiting an X Session on TTY3

#### Method 1: Exit i3 Normally

Press:

```
Mod + Shift + E
```

(Default **Mod key** is either `Alt` or `Super`.)

#### Method 2: Kill Xorg from Another TTY

1. Switch to another TTY (`CTRL+ALT+F2`).
2. Run:

```sh
pkill Xorg
```

#### Method 3: Kill X from Within TTY3

1. Press `CTRL+C` if you launched X manually.
2. Or run:

```sh
exit
```

or

```sh
logout
```

or

```sh
killall Xorg
```

---

### Running SDDM on TTY3 (Experimental)

SDDM is already running on TTY2. If you want to **try running it on TTY3**, use:

```sh
sudo sddm --display :1 --session i3 --vt 3
```

(Note: Running multiple DMs can cause issues.)

---

### Conclusion

- Linux has **multiple virtual consoles (TTYs)**, accessible via `CTRL+ALT+Fn` keys.
- The **display manager (DM)**, such as **SDDM**, manages graphical logins.
- **startx** allows manual launching of X sessions, useful for **running i3 on a second TTY**.
- You can exit X sessions via **i3 logout, killing Xorg, or switching TTYs**.

This guide should help you navigate Linux's multi-session capabilities effectively! 🚀
