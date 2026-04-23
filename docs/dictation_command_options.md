# Dictation Mode — App Switching Options

## The Problem

When in dictation mode, Talon tries to interpret everything as text to type. "Punch-through" commands (commands that work in dictation mode) can:
- **False-trigger** — normal speech accidentally activates a command
- **Fail to recognize** — Talon hears the command as text and types gibberish instead

The word `"focus"` is especially risky because it's a common English word.

---

## Options Considered

### Option A: Prefix with "command"
```
"command focus claude"
"command focus code"
"command focus terminal"
```
- **Pros:** Very explicit, low false-trigger risk
- **Cons:** Verbose (3 words to switch apps)

### Option B: Short unique prefix
```
"go focus claude"
"hey claude" / "hey code" / "hey terminal"
```
- **Pros:** Shorter, still distinct
- **Cons:** "hey" and "go" appear in normal speech, could false-trigger

### Option C: Unique verb unlikely in normal speech
```
"flip claude" / "flip code" / "flip terminal"
"summon claude" / "summon code"
"hop claude" / "hop code"
"zap claude" / "zap code"
```
- **Pros:** Single unique prefix, short (2 words), very low false-trigger risk
- **Cons:** Less intuitive at first

### Option D: Non-English or unusual trigger word
```
"zap claude" / "zap code"
```
- **Pros:** Extremely unlikely to false-trigger
- **Cons:** Feels unnatural

### Option E: No app-switching in dictation — use mode toggle (TESTING)
```
"command mode" → [pause] → "focus claude" → [pause] → "dictation mode"
```
- **Pros:** Cleanest separation, zero false triggers, full command set available
- **Cons:** 3 utterances + pauses (~2-3 seconds) instead of 1 utterance
- **Pauses required:** Talon processes one command at a time per mode. You CANNOT say it all as one sentence. Each step needs a ~0.3-0.5 second pause for Talon to switch modes before hearing the next phrase.

---

## What stays in dictation mode regardless

These commands are distinct enough to keep as punch-throughs in any option:

| Command | Why it's safe |
|---------|--------------|
| `"hunt this"` / `"hunt this <text>"` | "hunt" is uncommon in normal speech |
| `"open talon claude"` | 3-word unique phrase, won't false-trigger |
| `"copy that"` / `"paste that"` / etc. | Standard Talon, well-tested |
| `"slap"` / `"wipe"` / `"tab key"` | Unique words, not normal speech |
| Formatters (`"snake ..."`, `"camel ..."`) | Trigger word + pattern, low risk |
| `"tab next"` / `"tab last"` | Distinct phrases |

## Current test

**Branch:** `feature/option-e` — testing Option E (mode toggle approach)

If Option E feels too slow, the next candidate is **Option C** with a verb like `"flip"`.
