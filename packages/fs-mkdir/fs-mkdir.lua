local p=arg[1]; if not p then print("Usage: fs-mkdir <path>") return end; fs.makeDir(p); print("Created.")
