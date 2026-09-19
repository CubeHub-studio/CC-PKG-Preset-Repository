local p=arg[1] or "."
if not fs.exists(p) then print("Not found: "..p) return end
local bytes,files=0,0
local function walk(x)
 if fs.isDir(x) then for _,n in ipairs(fs.list(x)) do walk(fs.combine(x,n)) end
 else bytes=bytes+fs.getSize(x); files=files+1 end
end
walk(p)
print(("Path: %s"):format(p)); print(("Files: %d"):format(files)); print(("Bytes: %d"):format(bytes))