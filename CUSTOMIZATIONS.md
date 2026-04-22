# Talon Community — Customizations Log

This file documents all changes made to the Talon Community repo to support Alfredo Guerra's workflow. It explains what was changed, why, and where the files live so you can maintain and extend them.

## Table of Contents

- [How Talon Loads Files](#how-talon-loads-files)
- [1. Vocabulary — Domain Acronyms](#1-vocabulary--domain-acronyms)
- [2. Abbreviations](#2-abbreviations)
- [3. Word Replacements — Speech Correction](#3-word-replacements--speech-correction)
- [4. You Don't Need to Hardcode Table Names](#4-you-dont-need-to-hardcode-table-names)
- [5. Claude Code Voice Commands](#5-claude-code-voice-commands)
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
```

**Why:** These are supply chain and analytics terms that Talon's speech engine doesn't know. By adding them, you can say things like "snake B I T model baseline" and get `bit_model_baseline`. The spoken form "B I T" (spelled out) maps to the written form `bit`.

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
