local s,d=arg[1],arg[2] or (arg[1]..".bak"); if not s or not fs.exists(s) then print("Usage: backup-create <file> [backup]") return end; fs.copy(s,d); print("Backup: "..d)
