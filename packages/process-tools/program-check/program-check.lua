local name=arg[1]; if not name then print("Usage: program-check <program>"); return end
local path=shell.resolveProgram(name); if not path then print("Program not found."); return end
print("Resolved: "..path); local h=fs.open(path,"r"); if not h then return end; local lines=0; while h.readLine() do lines=lines+1 end; h.close(); print("Lines: "..lines); print("Size: "..fs.getSize(path).." bytes")