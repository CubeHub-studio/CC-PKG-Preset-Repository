local url=arg[1]
if not url then print("Usage: http-json <url>") return end
local ok,reason=http.checkURL(url); if not ok then print("URL denied: "..tostring(reason)) return end
local h,err=http.get(url); if not h then print("HTTP failed: "..tostring(err)) return end
local data=h.readAll(); h.close()
local value,parseErr=textutils.unserialiseJSON(data)
if value==nil then print("JSON parse failed: "..tostring(parseErr)) return end
print(textutils.serialize(value))