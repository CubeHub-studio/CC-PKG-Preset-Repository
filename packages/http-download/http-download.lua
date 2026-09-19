local url=arg[1]
local path=arg[2]
if not url or not path then print("Usage: http-download <url> <file>") return end
local allowed,reason=http.checkURL(url)
if not allowed then print("URL is not permitted: "..tostring(reason)) return end
local h,err=http.get(url)
if not h then print("Download failed: "..tostring(err)) return end
local data=h.readAll(); local code=h.getResponseCode(); h.close()
if code<200 or code>=300 then print(("HTTP %d: download failed"):format(code)) return end
local out=fs.open(path,"w"); if not out then print("Cannot open destination: "..path) return end
out.write(data); out.close()
print(("Downloaded %d bytes to %s"):format(#data,path))