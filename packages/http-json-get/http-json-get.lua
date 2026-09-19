local url=arg[1]; if not url then print("Usage: http-json-get <url>"); return end
local r,e=http.get(url,{["Accept"]="application/json"}); if not r then print("Request failed: "..tostring(e)); return end
local c=r.getResponseCode(); local body=r.readAll(); r.close(); if c<200 or c>=300 then print("HTTP "..c); return end
local ok,data=pcall(textutils.unserialiseJSON,body); if not ok or data==nil then print("Response was not valid JSON."); return end; print(textutils.serialize(data))