local q=arg[1]; if not q then print("Usage: help-view <topic>") return end; local ok=help.lookup(q); if not ok then print("No help found.") end
