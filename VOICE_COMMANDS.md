# Voice Commands Reference — Alfredo's Workflow

This is a living document of voice commands for each application in your daily workflow. It will be updated as your workflow expands.

## Table of Contents

- [General — Works Everywhere](#general--works-everywhere)
  - [Switching Between Applications](#switching-between-applications)
  - [Typing Text](#typing-text)
  - [The Alphabet](#the-alphabet)
  - [Code Formatters](#code-formatters--type-identifiers-by-voice)
  - [Clipboard & Undo](#clipboard--undo)
  - [Mouse-Free Clicking](#mouse-free-clicking)
- [VSCode — Full Reference](#vscode--full-reference)
  - [Navigating Your Layout](#navigating-your-layout)
  - [Working with Claude Code](#working-with-claude-code)
  - [Tabs](#tabs)
  - [Editor Splits](#editor-splits)
  - [Opening Files](#opening-files)
  - [File Actions](#file-actions)
  - [Command Palette](#command-palette)
  - [Code Navigation](#code-navigation)
  - [Search & Find/Replace](#search--findreplace)
  - [Symbol Navigation](#symbol-navigation)
  - [Selection](#selection)
  - [Line Operations](#line-operations)
  - [Multiple Cursors](#multiple-cursors)
  - [Code Intelligence](#code-intelligence)
  - [Code Formatting & Refactoring](#code-formatting--refactoring)
  - [Code Folding](#code-folding)
  - [Terminal](#terminal)
  - [Git in VSCode](#git-in-vscode)
  - [Display](#display)
  - [Debugging](#debugging)
  - [Testing](#testing)
- [Microsoft Edge](#microsoft-edge)
- [Microsoft Teams](#microsoft-teams)
  - [Navigation](#navigation)
  - [Messaging](#messaging)
  - [Calls & Meetings](#calls--meetings)
  - [Calendar](#calendar)
- [Typical Workflow Example](#typical-workflow-example)

---

## General — Works Everywhere

### Switching Between Applications

| You say | What happens |
|---------|-------------|
| `"focus code"` | Switch to VSCode |
| `"focus edge"` | Switch to Microsoft Edge |
| `"focus teams"` | Switch to Microsoft Teams |
| `"focus last"` | Switch to the previous app |
| `"focus"` | Show a list of running apps (pick by number) |
| `"running list"` | Toggle the running apps overlay |

### Typing Text

| You say | What happens |
|---------|-------------|
| `"air bat cap"` | Types `abc` (each word is a letter) |
| `"shift air"` | Types `A` (capital letter) |
| `"dictation mode"` | Switch to free-form typing — just talk |
| `"command mode"` | Switch back to voice commands |
| `"enter"` or `"slap"` | Press Enter |
| `"tab"` | Press Tab |
| `"escape"` | Press Escape |
| `"space"` | Press Space |
| `"wipe"` | Press Backspace |
| `"delete"` | Press Delete |

### The Alphabet

```
air=a  bat=b  cap=c  drum=d  each=e  fine=f  gust=g  harp=h
sit=i  jury=j  crunch=k  look=l  made=m  near=n  odd=o  pit=p
quench=q  red=r  sun=s  trap=t  urge=u  vest=v  whale=w
plex=x  yank=y  zip=z
```

### Code Formatters — Type Identifiers by Voice

| You say | Output | Use for |
|---------|--------|---------|
| `"snake <words>"` | `like_this` | SQL columns, Python vars |
| `"camel <words>"` | `likeThis` | JavaScript vars |
| `"hammer <words>"` | `LikeThis` | Class names |
| `"kebab <words>"` | `like-this` | CSS, CLI flags |
| `"constant <words>"` | `LIKE_THIS` | Constants |
| `"dotted <words>"` | `like.this` | Schema paths |
| `"smash <words>"` | `likethis` | No separators |
| `"string <words>"` | `'like this'` | Single-quoted |
| `"dub string <words>"` | `"like this"` | Double-quoted |

### Clipboard & Undo

| You say | What happens |
|---------|-------------|
| `"copy that"` | Copy selection |
| `"cut that"` | Cut selection |
| `"paste that"` | Paste |
| `"paste match"` | Paste without formatting |
| `"undo that"` | Undo |
| `"redo that"` | Redo |
| `"clone that"` | Duplicate selection |

### Mouse-Free Clicking

| You say | What happens |
|---------|-------------|
| `"grid show"` | Show numbered grid overlay on screen |
| (say a number) | Zoom into that grid cell |
| `"touch"` | Left click at the highlighted cell |
| `"righty"` | Right click |
| `"dub click"` | Double click |
| `"grid close"` | Close the grid |

---

## VSCode — Full Reference

Your layout: Explorer panel on the left, code editor in the center, Claude Code extension in a side panel.

### Navigating Your Layout

**The key concept:** VSCode has three main areas you move between — the **sidebar** (explorer, search, git, extensions), the **editor area** (your code tabs and splits), and the **bottom panel** (terminal, problems, output). Voice commands let you jump between them.

#### Moving Focus Between Areas

| You say | What happens |
|---------|-------------|
| `"bar explore"` | Focus the Explorer (file tree) in the sidebar |
| `"bar search"` | Focus the Search panel in the sidebar |
| `"bar source"` | Focus the Source Control (Git) panel |
| `"bar extensions"` | Focus the Extensions panel |
| `"bar outline"` | Focus the Outline panel (symbols in current file) |
| `"bar run"` | Focus the Debug panel |
| `"bar test"` | Focus the Test Explorer |
| `"bar switch"` | Toggle sidebar visibility on/off |
| `"focus editor"` | Jump back to the code editor from any panel |

#### Bottom Panel

| You say | What happens |
|---------|-------------|
| `"panel terminal"` | Focus the integrated terminal |
| `"panel problems"` | Focus the Problems panel (errors, warnings) |
| `"panel output"` | Focus the Output panel |
| `"panel control"` | Focus the Debug Console |
| `"panel switch"` | Toggle bottom panel visibility |

#### Working with Claude Code

| You say | What happens |
|---------|-------------|
| `"bar claude"` | Open Claude Code in the sidebar |
| `"focus claude"` | Focus the Claude Code input box (start typing immediately) |
| `"claude new tab"` | Open Claude Code in a new editor tab |
| `"claude open"` | Open/resume your last Claude Code session |
| `"focus editor"` | Jump back from Claude Code to your code editor |
| `"bar switch"` | Toggle sidebar visibility (hides/shows Claude Code if it's there) |

### Tabs

| You say | What happens |
|---------|-------------|
| `"tab next"` | Next tab |
| `"tab last"` or `"tab previous"` | Previous tab |
| `"go tab three"` | Jump to tab 3 (works for 1-9) |
| `"go tab final"` | Jump to the last tab |
| `"tab close"` | Close current tab |
| `"tab reopen"` | Reopen last closed tab |
| `"close other tabs"` | Close all tabs except current |
| `"close all tabs"` | Close everything |
| `"close tabs way right"` | Close all tabs to the right |
| `"close tabs way left"` | Close all tabs to the left |

### Editor Splits

| You say | What happens |
|---------|-------------|
| `"split window"` or `"split vertically"` | Split editor side by side |
| `"split horizontal"` | Split editor top/bottom |
| `"split next"` | Focus the right/next split |
| `"split last"` | Focus the left/previous split |
| `"go split two"` | Jump to split group 2 (works for 1-8) |
| `"split flip"` | Swap vertical/horizontal layout |
| `"split clear"` | Close current split |
| `"split clear all"` | Close all splits |
| `"split reset"` | Reset all splits to equal width |
| `"split max"` | Maximize current split |

### Opening Files

| You say | What happens |
|---------|-------------|
| `"file hunt"` | Open quick file picker (Ctrl+P) |
| `"file hunt <text>"` | Open picker pre-filled with text |
| `"file hunt paste"` | Open picker with clipboard contents |
| `"file reveal"` | Show current file in Explorer |
| `"file create"` | New untitled file |
| `"file create sibling"` | New file in same directory |
| `"go recent"` | Open recent files list |

### File Actions

| You say | What happens |
|---------|-------------|
| `"file save"` | Save current file |
| `"file save all"` | Save all open files |
| `"file copy name"` | Copy filename to clipboard |
| `"file copy path"` | Copy full path to clipboard |
| `"file copy local"` | Copy relative path |
| `"file rename"` | Rename current file |
| `"file move"` | Move current file |
| `"file clone"` | Duplicate current file |
| `"file delete"` | Delete current file |

### Command Palette

| You say | What happens |
|---------|-------------|
| `"please"` | Open command palette |
| `"please <text>"` | Open command palette and search for text |

This is your escape hatch — if you can't remember a specific voice command, say `"please"` followed by what you want. Example: `"please toggle word wrap"`.

### Code Navigation

| You say | What happens |
|---------|-------------|
| `"go five"` | Jump to line 5 (any number works) |
| `"go line start"` or `"head"` | Go to start of line |
| `"go line end"` or `"tail"` | Go to end of line |
| `"go way up"` or `"go top"` | Go to top of file |
| `"go way down"` or `"go bottom"` | Go to bottom of file |
| `"go word left"` | Move one word left |
| `"go word right"` | Move one word right |
| `"go declaration"` or `"follow"` | Go to definition of symbol under cursor |
| `"go back"` | Navigate back in history |
| `"go forward"` | Navigate forward in history |
| `"go implementation"` | Go to implementation |
| `"go type"` | Go to type definition |
| `"go usage"` | Show all references |

### Search & Find/Replace

| You say | What happens |
|---------|-------------|
| `"hunt this"` | Open find in current file (Ctrl+F) |
| `"hunt this <text>"` | Find specific text in file |
| `"hunt next"` | Next match |
| `"hunt previous"` | Previous match |
| `"hunt all"` | Search across all files (Ctrl+Shift+F) |
| `"hunt all <text>"` | Search all files for text |
| `"hunt case"` | Toggle case sensitivity |
| `"hunt word"` | Toggle whole word match |
| `"hunt expression"` | Toggle regex |
| `"replace this <text>"` | Open replace with search text |
| `"replace all"` | Replace all matches |

### Symbol Navigation

| You say | What happens |
|---------|-------------|
| `"symbol hunt"` | Search symbols in current file (Ctrl+Shift+O) |
| `"symbol hunt <text>"` | Search for specific symbol |
| `"symbol hunt all"` | Search symbols across workspace |

### Selection

| You say | What happens |
|---------|-------------|
| `"select all"` | Select everything |
| `"select line"` | Select current line |
| `"select word"` | Select current word |
| `"select more"` | Expand selection (smart select) |
| `"select less"` | Shrink selection |
| `"select line five"` | Select line 5 |
| `"select five until ten"` | Select lines 5-10 |

### Line Operations

| You say | What happens |
|---------|-------------|
| `"new line above"` | Insert blank line above |
| `"new line below"` or `"slap"` | Insert blank line below |
| `"clone line"` | Duplicate current line |
| `"drag line up"` | Move line up |
| `"drag line down"` | Move line down |
| `"clear line five"` | Delete line 5 |
| `"comment line five"` | Toggle comment on line 5 |
| `"indent more"` | Increase indentation |
| `"indent less"` | Decrease indentation |
| `"join lines"` | Join current and next line |

### Multiple Cursors

| You say | What happens |
|---------|-------------|
| `"cursor up"` | Add cursor above |
| `"cursor down"` | Add cursor below |
| `"cursor more"` | Add cursor at next match of selection |
| `"cursor skip"` | Skip current match, select next |
| `"cursor all"` | Select all matches |
| `"cursor lines"` | Add cursor at end of each selected line |
| `"cursor stop"` | Exit multi-cursor mode |

### Code Intelligence

| You say | What happens |
|---------|-------------|
| `"suggest show"` | Show autocomplete suggestions |
| `"hint show"` | Show parameter hints |
| `"definition peek"` | Peek definition inline |
| `"definition side"` | Open definition in side split |
| `"hover show"` | Show hover tooltip |
| `"problem next"` | Go to next error/warning |
| `"problem last"` | Go to previous error/warning |
| `"problem fix"` | Show quick fix options |

### Code Formatting & Refactoring

| You say | What happens |
|---------|-------------|
| `"format that"` | Format document |
| `"format selection"` | Format selected code |
| `"imports fix"` | Organize imports |
| `"rename that"` | Rename symbol |
| `"refactor this"` | Show refactoring options |

### Code Folding

| You say | What happens |
|---------|-------------|
| `"fold that"` | Fold current block |
| `"unfold that"` | Unfold current block |
| `"fold all"` | Fold everything |
| `"unfold all"` | Unfold everything |

### Terminal

| You say | What happens |
|---------|-------------|
| `"terminal toggle"` | Show/hide terminal |
| `"terminal new"` | New terminal |
| `"terminal next"` | Next terminal |
| `"terminal last"` | Previous terminal |
| `"terminal split"` | Split terminal |
| `"terminal zoom"` | Maximize/restore terminal |
| `"terminal trash"` | Close terminal |
| `"terminal one"` | Focus terminal 1 (1-9) |

### Git in VSCode

| You say | What happens |
|---------|-------------|
| `"git status"` | Open source control panel |
| `"git stage"` | Stage current file |
| `"git stage all"` | Stage all changes |
| `"git unstage"` | Unstage current file |
| `"git commit"` | Commit staged changes |
| `"git commit <message>"` | Commit with message |
| `"git pull"` | Pull with rebase |
| `"git push"` | Push to remote |
| `"git branch"` | Create branch |
| `"git diff"` | Open diff view |
| `"git stash"` | Stash changes |
| `"git stash pop"` | Pop stash |
| `"change next"` | Next changed line in diff |
| `"change last"` | Previous changed line |

### Display

| You say | What happens |
|---------|-------------|
| `"zoom in"` | Increase font size |
| `"zoom out"` | Decrease font size |
| `"zoom reset"` | Reset font size |
| `"zen switch"` | Toggle Zen mode |
| `"fullscreen switch"` | Toggle fullscreen |
| `"wrap switch"` | Toggle word wrap |
| `"minimap"` | Toggle minimap |
| `"theme switch"` | Change color theme |

### Debugging

| You say | What happens |
|---------|-------------|
| `"break point"` | Toggle breakpoint on current line |
| `"debug start"` | Start debugging |
| `"debug continue"` | Continue |
| `"debug pause"` | Pause |
| `"step over"` | Step over |
| `"debug step into"` | Step into |
| `"debug step out"` | Step out |
| `"debug restart"` | Restart |
| `"debug stopper"` | Stop debugging |
| `"debug console"` | Toggle debug console |

### Testing

| You say | What happens |
|---------|-------------|
| `"test run"` | Run test at cursor |
| `"test run file"` | Run all tests in file |
| `"test run all"` | Run all tests |
| `"test run failed"` | Rerun failed tests |
| `"test debug"` | Debug test at cursor |
| `"test cancel"` | Cancel running tests |

---

## Microsoft Edge

| You say | What happens |
|---------|-------------|
| `"focus edge"` | Switch to Edge |
| `"tab open"` | New tab |
| `"tab close"` | Close tab |
| `"tab next"` | Next tab |
| `"tab last"` | Previous tab |
| `"go tab three"` | Jump to tab 3 |
| `"tab reopen"` | Reopen closed tab |
| `"go back"` | Navigate back |
| `"go forward"` | Navigate forward |
| `"refresh it"` | Reload page |
| `"reload it hard"` | Hard refresh (bypass cache) |
| `"go home"` | Go to home page |
| `"go private"` | Open InPrivate window |
| `"bookmark it"` | Bookmark current page |
| `"bookmark show"` | Open bookmarks |
| `"history show"` | Open history |
| `"downloads show"` | Open downloads |
| `"dev tools"` | Toggle developer tools |
| `"go page"` | Focus the page content |

---

## Microsoft Teams

### Navigation

| You say | What happens |
|---------|-------------|
| `"focus teams"` | Switch to Teams |
| `"open activity"` | Activity feed (Ctrl+1) |
| `"open chat"` | Chat/Messages (Ctrl+2) |
| `"open teams"` | Teams channels (Ctrl+3) |
| `"open calendar"` | Calendar (Ctrl+4) |
| `"open calls"` | Calls (Ctrl+6) |
| `"open files"` | Files (Ctrl+7) |
| `"go to search"` | Jump to search bar (Ctrl+E) |
| `"open settings"` | Open settings |

### Messaging

| You say | What happens |
|---------|-------------|
| `"go to compose"` | Jump to message compose box |
| `"expand compose"` | Expand the compose box |
| `"send"` | Send message (Ctrl+Enter) |
| `"new line"` | New line without sending (Shift+Enter) |
| `"new chat"` | Start new conversation |
| `"reply to thread"` | Reply to current thread |
| `"attach file"` | Attach a file |

### Calls & Meetings

| You say | What happens |
|---------|-------------|
| `"toggle mute"` | Mute/unmute (Ctrl+Shift+M) |
| `"toggle video"` | Camera on/off (Ctrl+Shift+O) |
| `"start audio call"` | Start audio call |
| `"start video call"` | Start video call |
| `"accept audio call"` | Accept incoming audio call |
| `"accept video call"` | Accept incoming video call |
| `"decline call"` | Decline incoming call |
| `"screen share session"` | Start screen sharing |
| `"schedule meeting"` | Schedule a new meeting |

### Calendar

| You say | What happens |
|---------|-------------|
| `"view day"` | Day view |
| `"view work week"` | Work week view |
| `"view week"` | Week view |
| `"go to next day"` or `"go to next week"` | Navigate forward |
| `"go to previous day"` or `"go to previous week"` | Navigate back |

---

## Typical Workflow Example

Here's how a typical work session might flow entirely by voice:

1. **Start:** `"focus code"` — opens VSCode
2. **Open a file:** `"file hunt"` → say the filename → `"enter"`
3. **Navigate to a function:** `"symbol hunt get order"` → `"enter"`
4. **Edit some code:** `"go line end"` → `"slap"` → `"snake new column name"` → types `new_column_name`
5. **Ask Claude Code:** `"focus claude"` → dictate your question → `"enter"`
6. **Return to editor:** `"focus editor"`
7. **Search across project:** `"hunt all bit model baseline"`
8. **Open terminal:** `"terminal toggle"` → type dbt commands
9. **Commit changes:** `"bar source"` → `"git stage all"` → `"git commit updated model"`
10. **Switch to Teams:** `"focus teams"` → `"go to search"` → type a name → `"enter"` → `"go to compose"` → dictate your message → `"send"`
11. **Back to code:** `"focus code"`

---

*This document is updated as new applications and commands are added to the workflow.*
