local root=arg[1] or "."; local files,dirs=0,0
local function walk(p) for _,n in ipairs(fs.list(p)) do local q=fs.combine(p,n); if fs.isDir(q) then dirs=dirs+1; walk(q) else files=files+1 end end end
if not fs.isDir(root) then print("Not a directory."); return end; walk(root); print("Files: "..files); print("Directories: "..dirs)