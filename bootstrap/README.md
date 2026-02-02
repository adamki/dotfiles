# Dotfiles Bootstrap

This repository contains a simple, idempotent **bootstrap system** for setting up a new machine with your preferred directory structure, symlinked dotfiles, and future extensibility for OS-specific configuration.

The bootstrap process is broken into **numbered steps** (e.g. `01-dirs.sh`, `02-dotfiles.sh`), each of which is tracked using a persistent state directory so that steps are only executed once unless explicitly reset.

---

## Overview

The bootstrap system is designed to:

* Create required directories on a fresh machine
* Safely back up existing dotfiles
* Symlink your dotfiles repo into `$HOME`
* Avoid overwriting files unless explicitly intended
* Be **idempotent** — safe to re-run at any time
* Track completed steps using a lightweight state system

## How It Works

### Step Scripts

Bootstrap steps are defined as shell scripts named using numeric prefixes:

```bash
01-dirs.sh
02-dotfiles.sh
03-...
```

Each script:

* Has a unique `STEP` name
* Checks whether it has already been run
* Skips execution if already completed

### State Tracking

Each step marks completion by writing a file into:

```bash
~/.bootstrap_state
```

Example:

```bash
~/.bootstrap_state/dirs
~/.bootstrap_state/dotfiles
```

This allows:

* Fast re-runs
* Safe skipping of already completed steps
* Manual resetting of individual steps

---

## How To Run

From the root of your dotfiles repository:

```bash
./bootstrap/bootstrap.sh
```

This will:

1. Run all step scripts in numeric order
2. Skip any steps already marked as completed
3. Log all activity

---

## How To Re-Run Everything

To wipe all state and run the full bootstrap process again:

```bash
rm -rf ~/.bootstrap_state
./bootstrap.sh
```

This is useful when:

* Re-testing bootstrap logic
* Rebuilding a machine
* Debugging bootstrap steps

---

## How To Re-Run A Single Step

To re-run a specific step, simply delete its marker file.

Example: re-run the dotfiles symlink step:

```bash
rm ~/.bootstrap_state/dotfiles
./bootstrap.sh
```

Re-run directory creation:

```bash
rm ~/.bootstrap_state/dirs
./bootstrap.sh
```

---

## Changing The State Directory

The state directory defaults to:

```bash
~/.bootstrap_state
```

You can override this by setting:

```bash
export BOOTSTRAP_STATE_DIR="$HOME/.bootstrap_state_dev"
```

This is useful for:

* Testing
* Multiple bootstrap profiles
* Dry runs

---
