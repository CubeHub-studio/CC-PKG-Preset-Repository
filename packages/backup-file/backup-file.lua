local p=arg[1]
if not p or not fs.exists(p) or fs.isDir(p) then print("Usage: backup-file <file>") return end
local stamp=os.epoch("utc")
local dest=p.."."..stamp..".bak"
fs.copy(p,dest)
print("Backup: "..dest)