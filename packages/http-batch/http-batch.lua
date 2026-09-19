local path=arg[1]; if not path then print("Usage: http-batch <url-file>"); return end
local h=fs.open(path,"r"); if not h then print("File not found."); return end
local raw=h.readAll() or ""; h.close(); local total,good=0,0
for url in (raw.."\n"):gmatch("(.-)\n") do
 url=url:gsub("^%s+",""):gsub("%s+$","")
 if url~="" and not url:match("^#") then
  total=total+1; local r,e=http.get(url)
  if r then local c=r.getResponseCode(); r.close(); print(c.." "..url); if c>=200 and c<400 then good=good+1 end
  else print("ERR "..url.." "..tostring(e)) end
 end
end
print(("Successful: %d/%d"):format(good,total))