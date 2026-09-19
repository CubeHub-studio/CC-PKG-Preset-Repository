local path=arg[1]; if not path then print("Usage: json-file <file>"); return end
local h=fs.open(path,"r"); if not h then print("File not found."); return end
local raw=h.readAll() or ""; h.close(); local ok,data=pcall(textutils.unserialiseJSON,raw)
if not ok or data==nil then print("Invalid JSON."); return end
print("Valid JSON."); print(textutils.serializeJSON(data))
if type(data)=="table" then local n=0; for _ in pairs(data) do n=n+1 end; print("Top-level entries: "..n) end