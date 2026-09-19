local p=arg[1]; if not p then print("Usage: fs-delete <path>") return end; print("Type YES to delete "..p); if read()=="YES" then fs.delete(p); print("Deleted.") end
