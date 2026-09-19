local url,path=arg[1],arg[2]; if not url or not path then print("Usage: http-mirror <url> <file>"); return end
local r,e=http.get(url,nil,true); if not r then print("HTTP error: "..tostring(e)); return end
local c=r.getResponseCode(); local data=r.readAll(); r.close(); if c<200 or c>=300 then print("HTTP "..c); return end
if fs.exists(path) then local h=fs.open(path,"r"); local old=h.readAll() or ""; h.close(); if old==data then print("Already current."); return end end
local h=fs.open(path,"w"); h.write(data); h.close(); print("Updated "..path.." ("..#data.." bytes)")