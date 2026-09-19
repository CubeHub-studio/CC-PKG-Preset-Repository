local src,dst=arg[1],arg[2]; if not src or not dst then print("Usage: backup-tree <source> <destination>"); return end
if not fs.exists(src) or fs.exists(dst) then print("Source missing or destination exists."); return end
local files=0
local function copy(a,b) fs.makeDir(b); for _,n in ipairs(fs.list(a)) do local s=fs.combine(a,n); local d=fs.combine(b,n); if fs.isDir(s) then copy(s,d) else local i=fs.open(s,"rb"); local x=i.readAll(); i.close(); local o=fs.open(d,"wb"); o.write(x); o.close(); files=files+1 end end end
if fs.isDir(src) then copy(src,dst) else print("Source must be a directory."); return end; print("Backed up "..files.." files.")