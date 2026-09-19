local url=arg[1]; if not url then print("Usage: http-headers <url>"); return end
local r,e=http.get(url); if not r then print("Request failed: "..tostring(e)); return end
print("HTTP "..r.getResponseCode()); for k,v in pairs(r.getResponseHeaders()) do print(k..": "..tostring(v)) end; r.close()