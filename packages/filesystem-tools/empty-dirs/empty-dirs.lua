local root=arg[1] or "."; if root=="/" then print("Refusing root."); return end
local removed=0
local function clean(p)
 for _,n in ipairs(fs.list(p)) do local q=fs.combine(p,n)
  if fs.isDir(q) then clean(q); if #fs.list(q)==0 then fs.delete(q); removed=removed+1; print("Removed "..q) end end
 end
end
if fs.isDir(root) then clean(root); print("Removed "..removed.." empty directories.") else print("Not a directory.") end