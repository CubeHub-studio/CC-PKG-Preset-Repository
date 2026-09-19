local outPath=arg[1]; if not outPath or #arg<2 then print("Usage: file-join <output> <input1> [input2...]"); return end
local o=fs.open(outPath,"w"); if not o then print("Cannot open output."); return end
for i=2,#arg do local h=fs.open(arg[i],"r"); if not h then o.close(); print("Missing "..arg[i]); return end; while true do local l=h.readLine(); if not l then break end; o.writeLine(l) end; h.close() end
o.close(); print("Joined "..(#arg-1).." file(s).")