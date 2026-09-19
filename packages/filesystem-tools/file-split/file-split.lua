local path=arg[1]; local linesPer=tonumber(arg[2]) or 100; if not path then print("Usage: file-split <file> [lines]"); return end
local h=fs.open(path,"r"); if not h then print("File not found."); return end; local part=1; local count=0; local out
local function openPart() if out then out.close() end; out=fs.open(path.."."..part,"w"); part=part+1; count=0 end
openPart()
while true do local l=h.readLine(); if not l then break end; if count>=linesPer then openPart() end; out.writeLine(l); count=count+1 end
h.close(); out.close(); print("Created "..(part-1).." part(s).")