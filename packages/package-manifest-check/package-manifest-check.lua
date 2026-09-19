local path=arg[1] or "package.json"; if not fs.exists(path) then print("Missing "..path); return end
local h=fs.open(path,"r"); local ok,m=pcall(textutils.unserialiseJSON,h.readAll()); h.close(); if not ok or type(m)~="table" then print("Invalid JSON."); return end
local required={"name","version","description","files"}; local good=true
for _,k in ipairs(required) do if m[k]==nil then print("Missing: "..k); good=false end end
if type(m.files)~="table" then print("files must be an array/table."); good=false end
print(good and "Manifest looks valid." or "Manifest has errors.")