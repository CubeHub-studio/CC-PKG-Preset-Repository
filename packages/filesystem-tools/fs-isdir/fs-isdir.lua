local p=arg[1] or ""; print(tostring(fs.exists(p) and fs.isDir(p)))
