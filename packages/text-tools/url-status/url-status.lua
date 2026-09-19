local url=arg[1]; if not url then print("Usage: url-status <url>"); return end
local allowed,why=http.checkURL(url); print("Allowed: "..tostring(allowed).." "..tostring(why or ""))
if not allowed then return end
local r,e=http.get(url); if not r then print("Request failed: "..tostring(e)); return end
local code,msg=r.getResponseCode(); print("Status: "..code.." "..tostring(msg))
print("Headers:")
for k,v in pairs(r.getResponseHeaders()) do print("  "..k..": "..tostring(v)) end
r.close()