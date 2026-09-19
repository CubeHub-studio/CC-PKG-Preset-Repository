local root=arg[1] or "."; local files,dirs,bytes=0,0,0
local function walk(p) if fs.isDir(p) then dirs=dirs+1; for _,n in ipairs(fs.list(p)) do walk(fs.combine(p,n)) end else files=files+1; bytes=bytes+fs.getSize(p) end end
if not fs.exists(root) then print("Not found."); return end
walk(root); print("Path: "..root); print("Files: "..files); print("Directories: "..dirs); print("Bytes: "..bytes)