local path=arg[1]; if not path then print("Usage: table-view <json-file>"); return end
local h=fs.open(path,"r"); if not h then print("File not found."); return end; local ok,t=pcall(textutils.unserialiseJSON,h.readAll()); h.close(); if not ok then print("Invalid JSON."); return end
for k,v in pairs(t) do print(tostring(k).." = "..textutils.serialize(v)) end