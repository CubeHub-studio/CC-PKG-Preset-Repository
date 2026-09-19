local a,b=arg[1],arg[2]; if not a or not b then print("Usage: fs-move <from> <to>") return end; fs.move(a,b); print("Moved.")
