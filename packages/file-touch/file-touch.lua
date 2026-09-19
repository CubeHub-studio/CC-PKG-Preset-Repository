local p=arg[1]; if not p then print("Usage: file-touch <file>") return end; if not fs.exists(p) then local h=fs.open(p,"w"); h.close() end; print("Ready: "..p)
