local path,key=arg[1],arg[2]; if not path or not key then print("Usage: json-query <file> <key>"); return end
local h=fs.open(path,"r"); if not h then print("File not found."); return end; local ok,t=pcall(textutils.unserialiseJSON,h.readAll()); h.close(); if not ok then print("Invalid JSON."); return end
print(textutils.serialize(t[key]))