local path=arg[1] or "/config.json"; local op=arg[2] or "list"; local key,val=arg[3],arg[4]; local data={}
if fs.exists(path) then local h=fs.open(path,"r"); local raw=h.readAll() or ""; h.close(); local ok,v=pcall(textutils.unserialiseJSON,raw); if ok and type(v)=="table" then data=v end end
local function save() local h=fs.open(path,"w"); h.write(textutils.serializeJSON(data)); h.close() end
if op=="get" then print(textutils.serialize(data[key]))
elseif op=="set" and key and val~=nil then data[key]=val; save(); print("Saved "..key)
elseif op=="delete" and key then data[key]=nil; save(); print("Deleted "..key)
elseif op=="list" then for k,v in pairs(data) do print(k.." = "..textutils.serialize(v)) end
else print("Usage: config-store [file] <get|set|delete|list> [key] [value]") end