# Commands that punch through dictation mode so you can stay in dictation
# full-time without constantly toggling back to command mode.
mode: dictation
-

# Option E: No app-switching in dictation mode.
# Say "command mode" → [pause] → your command → [pause] → "dictation mode"
# All focus/bar/tab commands are available in command mode (no changes needed there).

# Search — opens find/search in whatever app you're in
hunt this: edit.find()
hunt this <user.text>: edit.find(text)

# Code formatters — same syntax as command mode, no need to say "formatted"
# Prepend a space so dictation flows naturally (e.g. "for snake ai engineering" → "for ai_engineering")
<user.format_code>+$:
    insert(" ")
    user.insert_many(format_code_list)
{user.prose_formatter} <user.prose>$:
    insert(" ")
    user.insert_formatted(prose, prose_formatter)
<user.formatters> that: user.formatters_reformat_selection(user.formatters)

# Essential clipboard & editing
copy that: edit.copy()
cut that: edit.cut()
paste that: edit.paste()
undo that: edit.undo()
redo that: edit.redo()
select all: edit.select_all()

# Open PowerShell in the Talon community directory and launch Claude Code
open talon claude:
    user.system_command_nb("start powershell -NoExit -Command \"cd 'C:\\Users\\aguerra3\\AppData\\Roaming\\talon\\user\\community'; claude\"")

# Keys you'll want without leaving dictation
slap: key(enter)
tab key: key(tab)
wipe: key(backspace)
delete: key(delete)
