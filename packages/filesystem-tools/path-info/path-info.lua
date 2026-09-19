local p=arg[1]
if not p then print("Usage: path-info <path>") return end
print("Combined: "..fs.combine("",p))
print("Name: "..fs.getName(p))
print("Directory: "..fs.getDir(p))
print("Extension: "..(fs.getName(p):match("%.([^%.]+)$") or ""))