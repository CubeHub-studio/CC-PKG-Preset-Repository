local p=arg[1]
local s=table.concat(arg," ",2)
if not p or s=="" then print("Usage: file-append <file> <text>") return end
local h=fs.open(p,"a"); h.writeLine(s); h.close(); print("Appended to "..p)