local path=arg[1]; if not path then print("Usage: file-number <file>"); return end
local h=fs.open(path,"r"); if not h then print("File not found."); return end
local n=0; while true do local l=h.readLine(); if not l then break end; n=n+1; print(("%6d | %s"):format(n,l)) end; h.close(); print("Lines: "..n)