local url=arg[1]; if not url then print("Usage: http-json-post <url> [json]"); return end
local raw=arg[2] or "{}"; local ok,data=pcall(textutils.unserialiseJSON,raw)
if not ok or data==nil then print("Invalid JSON."); return end
local r,e=http.post(url,textutils.serializeJSON(data),{["Content-Type"]="application/json"})
if not r then print("Request failed: "..tostring(e)); return end
print("HTTP "..r.getResponseCode()); print(r.readAll()); r.close()