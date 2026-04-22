# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is **Talon Community** — the community-maintained voice command set for [Talon](https://talonvoice.com/). It enables hands-free computer control via voice on macOS, Windows, and Linux. The repo lives inside `~/.talon/user/community/` and Talon auto-loads all `.talon` and `.py` files from it. You are instructed to help the end-user, Alfredo Guerra, in working with and configuring Alfredo to meet his needs. He suffers from chronic pain in fingers and wrists due to excessive mousing and keyboarding. Talon will be used to enable Alfredo in streamlining his workflow by integrating a lot of Talon features under community.

## Commands

**Run tests:**
```
pytest
```

**Formatting/linting (via pre-commit):**
```
pre-commit run --all-files
```

Individual formatters: `black` (Python), `isort` (imports), `flynt` (f-strings), `prettier` (general), `talon-fmt` and `snippet-fmt` (Talon-specific files).

Python target version: 3.10+.

## File Types

- **`.talon`** — Voice command definitions using Talon's declarative syntax (context matchers, key bindings, voice rules that map spoken phrases to actions)
- **`.py`** — Python implementations of actions, modules, contexts, and listeners (uses the `talon` API: `Module`, `Context`, `actions`, `app`, `registry`)
- **`.talon-list`** — Customizable spoken-form word lists that users can edit without touching code
- **`.csv`** — Editable data files in `settings/` (abbreviations, file extensions, word replacements)

## Architecture

**Module layout:**

| Directory | Purpose |
|-----------|---------|
| `core/` | Foundation: text editing, formatters, keys, mouse, help system, modes, window management, navigation |
| `lang/` | Programming language support (27+ languages). `lang/tags/` has generic language tags (comments, functions, operators); `lang/<language>/` has language-specific implementations |
| `apps/` | Application-specific commands (76+ apps: VSCode, Chrome, Git, etc.). Platform variants use `*_win.py`, `*_mac.py`, `*_linux.py` suffixes |
| `tags/` | Behavioral command groups activated by Talon tags (browser, terminal, file_manager, debugger) |
| `plugin/` | Optional features: eye tracking, gamepad, macros, mouse grid, screenshots, draft editor |
| `settings/` | CSV data files for abbreviations, file extensions, word replacements |
| `stored_state/` | Persistent user state managed via `core/stored_state_management/stored_state.py` |
| `test/` | pytest tests with Talon API stubs in `test/stubs/` |

**Key patterns:**

- **Context-based activation** — Commands are only available when their Talon context matches (app name, OS, window title, active tags). This is the central dispatch mechanism.
- **Tags as capability groups** — Tags like `user.terminal`, `user.file_manager`, `user.git` enable/disable entire command sets. Language support activates via the `code.language` context.
- **Actions as the extension API** — Python files define actions via `@mod.action_class`; `.talon` files bind voice commands to those actions. Multiple contexts can provide different implementations of the same action.
- **Stored state** — Use actions from `core/stored_state_management/stored_state.py` (not raw file I/O) to persist state to the `stored_state/` directory (see P08 in CONTRIBUTING.md).

## Contributing Conventions

From CONTRIBUTING.md — the principles most relevant to code changes:

- **P01**: Prefer `[object][verb]` over `[verb][object]` for voice commands (e.g., `file save` not `save file`)
- **P03/P04**: macOS apps use `app.bundle` matcher; Windows apps use both `app.name` and `app.exe` matchers
- **P05**: Prefer `.talon-list` files for lists (easier for non-programmers to customize)
- **P08**: Use stored state management actions for disk persistence (not raw file I/O)
- **P09**: Raise exceptions for unavailable actions in a context (fail fast; don't silently no-op)