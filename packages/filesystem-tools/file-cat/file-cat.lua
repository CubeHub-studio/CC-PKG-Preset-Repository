local p=arg[1]; if not p then print("Usage: file-cat <file>") return end; local h=fs.open(p,"r"); if not h then print("Cannot open file.") return end; print(h.readAll()); h.close()
