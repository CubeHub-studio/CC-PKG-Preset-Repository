local p=arg[1] or "."
if not fs.exists(p) or not fs.isDir(p) then print("Directory not found.") return end
local bytes,files,dirs=0,0,0
local function walk(x)
 dirs=dirs+1
 for _,n in ipairs(fs.list(x)) do local q=fs.combine(x,n); if fs.isDir(q) then walk(q) else files=files+1; bytes=bytes+fs.getSize(q) end end
end
walk(p)
print(("Directories: %d"):format(dirs)); print(("Files: %d"):format(files)); print(("Bytes: %d"):format(bytes))