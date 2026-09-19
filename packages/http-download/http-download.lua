local url,path=arg[1],arg[2]; local force=arg[3]=="--force"
if not url or not path then print("Usage: http-download <url> <file> [--force]"); return end
if fs.exists(path) and not force then print("Destination exists; use --force."); return end
local r,e=http.get(url,nil,true); if not r then print("HTTP error: "..tostring(e)); return end
local code,msg=r.getResponseCode(); local data=r.readAll(); r.close()
if code<200 or code>=300 then print("HTTP "..code.." "..tostring(msg)); return end
local h=fs.open(path,"wb"); h.write(data); h.close(); print(("Saved %d bytes."):format(#data))