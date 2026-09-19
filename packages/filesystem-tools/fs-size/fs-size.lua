local p=arg[1]; if p and fs.exists(p) and not fs.isDir(p) then print(fs.getSize(p)) else print("Not a file.") end
