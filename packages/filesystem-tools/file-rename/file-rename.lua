local a,b=arg[1],arg[2]
if not a or not b then print("Usage: file-rename <old> <new>") return end
if not fs.exists(a) then print("Source not found.") return end
if fs.exists(b) then print("Destination already exists.") return end
fs.move(a,b); print("Renamed "..a.." -> "..b)