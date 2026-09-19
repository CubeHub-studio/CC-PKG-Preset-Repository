local a,b=arg[1],arg[2]; if not a or not b then print("Usage: fs-copy <from> <to>") return end; fs.copy(a,b); print("Copied.")
