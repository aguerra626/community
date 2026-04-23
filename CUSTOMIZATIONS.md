# Talon Community — Customizations Log

This file documents all changes made to the Talon Community repo to support Alfredo Guerra's workflow. It explains what was changed, why, and where the files live so you can maintain and extend them.

## Table of Contents

- [How Talon Loads Files](#how-talon-loads-files)
- [1. Vocabulary — Domain Acronyms](#1-vocabulary--domain-acronyms)
- [2. Abbreviations](#2-abbreviations)
- [3. Word Replacements — Speech Correction](#3-word-replacements--speech-correction)
- [4. You Don't Need to Hardcode Table Names](#4-you-dont-need-to-hardcode-table-names)
- [5. Claude Code Voice Commands](#5-claude-code-voice-commands)
- [6. Dictation-First Mode — Stay in Dictation Full-Time](#6-dictation-first-mode--stay-in-dictation-full-time)
- [7. Quick-Launch Claude Code in the Talon Directory](#7-quick-launch-claude-code-in-the-talon-directory)
- [Directory Reference](#directory-reference)
- [Adding New Customizations](#adding-new-customizations)

---

## How Talon Loads Files

Talon automatically loads every `.talon`, `.py`, `.talon-list`, and `.csv` file under `~/.talon/user/`. There is no build step. When you save a file, Talon picks up the changes within a few seconds. If something breaks, Talon shows an error notification — just fix the file and save again.

---

## 1. Vocabulary — Domain Acronyms

**File:** `core/vocabulary/vocabulary.talon-list`

**What it does:** Teaches Talon to recognize words that aren't in standard English. Without this, when you say "BIT" or "MRP" or "dbt", Talon might hear gibberish.

**Format:** Each line is either:
- `spoken form: written form` — when what you say differs from what gets typed
- `word` — when spoken and written forms are the same

**What was added:**
```
# Database / ERP acronyms
SQL
sequel: SQL
ERP
my ERP: my ERP
M P S: MPS
W M S: WMS
I M S: IMS
G L: GL
M E S: MES
P P C: PPC
H C M: HCM
P L M: PLM

# Git - Talon hears "get" instead of "git"
git
git status: git status
git commit: git commit
git push: git push
git pull: git pull
git stash: git stash
git diff: git diff
git merge: git merge
git branch: git branch
git clone: git clone
git fetch: git fetch
git log: git log
git checkout: git checkout
git rebase: git rebase
git init: git init
git add: git add

# Tools
Claude
Claude Code: Claude Code
Talon

# Domain acronyms - supply chain / analytics
B I T: bit
S S: ss
mit S S: mitss
M R P: mrp
B O M: bom
B D F: bdf
basbi
cume
qty
D B T: dbt
shipset
shipsets

# Blue Origin programs
gs one: GS1
gs two: GS2
glen stage one: Glenn Stage 1
glen stage two: Glenn Stage 2
```

**Why the git entries:** Talon hears "git" as "get" because "get" is a common English word. Adding `git` as a standalone word helps, but the multi-word phrases (`git status: git status`) are the real fix — they tell Talon to treat "git status" as a known phrase and write it correctly. We can't use words_to_replace.csv here because replacing "get" globally would break actual uses of the word "get".

**Why the domain terms:**  These are supply chain and analytics terms that Talon's speech engine doesn't know. By adding them, you can say things like "snake B I T model baseline" and get `bit_model_baseline`. The spoken form "B I T" (spelled out) maps to the written form `bit`.

**How to add more:** Open the file, add a new line at the bottom following the same format. Talon reloads automatically.

---

## 2. Abbreviations

**File:** `settings/abbreviations.csv`

**What it does:** Maps abbreviated written forms to their full spoken forms. This is used by the formatter system — when you say "quantity" while using a code formatter, it knows to write `qty`.

**Format:** CSV with columns `Abbreviation,Spoken Form`

**What was added:**
```csv
bdf,B D F
bom,bill of materials
dbt,D B T
mitss,mit S S
mrp,M R P
qty,quantity
ss,safety stock
```

**Why:** When you're dictating SQL or dbt code, you can say the full English phrase and Talon writes the abbreviation. For example, in snake_case mode: "snake safety stock target" could leverage these mappings.

---

## 3. Word Replacements — Speech Correction

**File:** `settings/words_to_replace.csv`

**What it does:** Automatically corrects common misrecognitions. When Talon hears "beams" but you meant "teams", this file fixes it.

**Format:** CSV with columns `Replacement,Original`. The replacement (correct word) is first, the original (misheard word) is second.

**What was added:**
```csv
teams,beams
Claude,clod
Talon,talent
SQL,sol
SQL,sequel
ERP,ARP
ERP,Earp
ERP,ape
MPS,ps
WMS,WM
IMS,sims
BOM,bon
PLM,pam
GL,gel
MES,Ms
MES,am yes
mBOM,embalm
LLM,Allam
kanban,can ban
kanban,con ban
```

**Why:** Talon's speech engine consistently mishears certain words. These were discovered during actual use:
- "teams" is heard as "beams"
- "Claude" is heard as "clod"
- "Talon" is heard as "talent"

**How to add more:** When you notice Talon consistently getting a word wrong, add a line: `correct_word,misheard_word`. Save and Talon picks it up immediately.

---

## 4. You Don't Need to Hardcode Table Names

The formatter system already handles constructing identifiers from spoken words. Key formatters:

| You say | Formatter | Output |
|---------|-----------|--------|
| `"snake bit model baseline"` | SNAKE_CASE | `bit_model_baseline` |
| `"snake dev bit model baseline"` | SNAKE_CASE | `dev_bit_model_baseline` |
| `"camel get order status"` | camelCase | `getOrderStatus` |
| `"hammer order service"` | PascalCase | `OrderService` |
| `"kebab my component"` | kebab-case | `my-component` |
| `"constant max retries"` | SCREAMING_SNAKE | `MAX_RETRIES` |
| `"dotted bdf prod"` | dot.separated | `bdf.prod` |

The vocabulary entries (section 1 above) make sure the individual words are recognized. The formatters handle joining them in the right format. This is why we don't need a separate entry for every table name — just make sure each word in the name is in the vocabulary.

---

## 5. Claude Code Voice Commands

**File:** `apps/vscode/vscode.talon`

**What was added (lines 31-35):**
```
# Claude Code
bar claude: user.vscode("claude-vscode.sidebar.open")
focus claude: user.vscode("claude-vscode.focus")
claude new tab: user.vscode("claude-vscode.editor.open")
claude open: user.vscode("claude-vscode.editor.openLast")
```

**Why:** The Talon Community repo has no built-in commands for the Claude Code extension because it's newer than the repo. These commands follow the exact same pattern as every other `bar *` and `focus *` command — they call VSCode's internal command IDs.

**How I found the command IDs:** Every VSCode extension declares its commands in its `package.json`. I read `~/.vscode/extensions/anthropic.claude-code-*/package.json` and found the `contributes.commands` section. The key IDs are:
- `claude-vscode.sidebar.open` — opens Claude in sidebar
- `claude-vscode.focus` — focuses the input box
- `claude-vscode.editor.open` — opens in a new tab
- `claude-vscode.editor.openLast` — opens/resumes last session

**How to add commands for other extensions:** Same process — find the extension's `package.json` under `~/.vscode/extensions/`, look at `contributes.commands`, and add a line to `apps/vscode/vscode.talon` following the pattern `voice phrase: user.vscode("command.id")`.

---

## 6. Dictation-First Mode — Stay in Dictation Full-Time

**Files changed:**
- `core/modes/dictation_shortcuts.talon` (new)
- `settings.talon` (modified)

**Problem:** Constantly switching between dictation mode and command mode is a pain. You just want to talk, switch apps, search, and keep going without toggling modes.

**Solution:** Two changes:

1. **Default startup mode set to dictation** — In `settings.talon`, changed `user.initial_mode` from `"command"` to `"dictation"`. Talon now starts in dictation mode so you can immediately start typing by voice.

2. **Punch-through commands** — Created `core/modes/dictation_shortcuts.talon` with essential commands that work without leaving dictation mode:

```
# App switching
focus code         → Switch to VSCode
focus edge         → Switch to Edge
focus teams        → Switch to Teams
focus obsidian     → Switch to Obsidian
focus last         → Switch to previous app (Alt-Tab equivalent)

# Search
hunt this          → Open find/search in current app
hunt this <text>   → Search for specific text

# VSCode navigation (keyboard shortcuts, since vscode actions aren't available in dictation)
focus editor       → Jump back to code editor (Ctrl+1 = focus first editor group)
focus claude       → Focus Claude Code input (via command palette)
bar claude         → Open Claude Code sidebar (via command palette)
focus terminal     → Focus VSCode integrated terminal (Ctrl+`)
focus talon claude → Switch to the external PowerShell window running Claude Code CLI
tab next           → Next tab (Ctrl+PageDown)
tab last           → Previous tab (Ctrl+PageUp)

# Clipboard & editing
copy that / cut that / paste that / undo that / redo that / select all

# Essential keys
slap (Enter) / tab key (Tab) / wipe (Backspace) / delete (Delete)
```

**Why keyboard shortcuts for Claude Code?** The `user.vscode()` action is only available in command mode context. In dictation mode, we use `key(ctrl-shift-p)` to open the command palette and type the command name — same result, works from any mode.

**Code formatters in dictation mode:** The command-mode formatters (`snake`, `camel`, `dotted`, etc.) are also wired in so you can say `"snake safety stock target"` directly without switching modes or saying "formatted" first. This is done by re-declaring the `<user.format_code>` capture rules under the `mode: dictation` context. The dictation-mode versions prepend a space before the formatted text so it flows naturally with surrounding dictation (e.g. "for snake ai engineering" produces `for ai_engineering`, not `forai_engineering`).

**How to add more punch-through commands:** Edit `core/modes/dictation_shortcuts.talon`. Any command defined under `mode: dictation` will be available while dictating. You can still say `"command mode"` anytime to access the full command set.

---

## 7. Quick-Launch Claude Code in the Talon Directory

**File:** `core/modes/dictation_shortcuts.talon`

**What was added:**
```
open talon claude:
    user.system_command_nb("start powershell -NoExit -Command \"cd 'C:\\Users\\aguerra3\\AppData\\Roaming\\talon\\user\\community'; claude\"")
```

**Why:** The Talon community directory is buried at `C:\Users\aguerra3\AppData\Roaming\talon\user\community` — not easy to remember or navigate to. This command opens a PowerShell window, `cd`s into that directory, and launches the Claude Code CLI so you can start working on Talon config immediately.

**How it works:** Uses the existing `user.system_command_nb` action (defined in `core/system_command.py`) to run a non-blocking shell command. The `start powershell -NoExit` launches a new PowerShell window that stays open after `claude` exits, so you can keep using the terminal.

**Voice trigger:** Say `"open talon claude"` from dictation mode (or command mode).

---

## 8. App Name Overrides — Reliable App Switching

**File:** `core/app_switcher/app_name_overrides.windows.csv`

**What was added:**
```csv
code, Code.exe
powershell, powershell.exe
```

**Why:** The app switcher auto-generates spoken forms from running app names, but some names don't generate clean matches. "Visual Studio Code" has "visual" and "studio" in the exclusion list, which can leave "code" unreliable. Adding explicit overrides guarantees the mapping.

**Also added:** `focus talon claude` command in `core/windows_and_tabs/window_management.talon` — switches to the PowerShell window where Claude Code CLI is running. This is a command-mode command (say `"command mode"` first if in dictation).

---

## Directory Reference

```
community/
├── core/vocabulary/vocabulary.talon-list   ← custom words Talon recognizes
├── settings/
│   ├── abbreviations.csv                   ← short forms (qty, mrp, etc.)
│   └── words_to_replace.csv                ← speech correction rules
├── core/formatters/
│   ├── formatters.py                       ← formatter logic (snake, camel, etc.)
│   └── code_formatter.talon-list           ← spoken names for formatters
├── core/modes/dictation_shortcuts.talon    ← commands that work in dictation mode
├── CUSTOMIZATIONS.md                       ← this file
└── VOICE_COMMANDS.md                       ← application voice command reference
```

---

## Adding New Customizations

**New word Talon doesn't recognize:**
→ Add to `core/vocabulary/vocabulary.talon-list`

**New abbreviation:**
→ Add to `settings/abbreviations.csv`

**Talon keeps mishearing a word:**
→ Add to `settings/words_to_replace.csv`

**New application commands:**
→ Check `apps/` for existing support, or create a new `.talon` file

**Want to see all available formatters:**
→ Say `"help format"` to Talon
