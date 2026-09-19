local p=arg[1] or "/" local ok,free,cap=pcall(fs.getFreeSpace,p) if not ok then print("Invalid path") return end print("Path: "..p) print("Free: "..free.." bytes") print("Capacity: "..cap.." bytes")
