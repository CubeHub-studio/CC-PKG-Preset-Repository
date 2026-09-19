local src,dst=arg[1],arg[2]; local apply=false
for i=1,#arg do if arg[i]=="--apply" then apply=true end end
if not src or not dst then print("Usage: fs-sync <source> <destination> [--apply]"); return end
if not fs.isDir(src) then print("Source is not a directory."); return end
local changed=0
local function same(a,b)
 if not fs.exists(b) or fs.isDir(b) then return false end
 local x=fs.open(a,"rb"); local y=fs.open(b,"rb"); local ax=x.readAll(); local by=y.readAll(); x.close(); y.close(); return ax==by
end
local function sync(a,b)
 if not fs.exists(b) then if apply then fs.makeDir(b) else print("WOULD CREATE "..b) end end
 for _,n in ipairs(fs.list(a)) do local s=fs.combine(a,n); local d=fs.combine(b,n)
  if fs.isDir(s) then sync(s,d)
  elseif not same(s,d) then changed=changed+1; print((apply and "COPY " or "WOULD COPY ")..s.." -> "..d)
   if apply then local i=fs.open(s,"rb"); local data=i.readAll(); i.close(); local o=fs.open(d,"wb"); o.write(data); o.close() end
  end
 end
end
sync(src,dst); print("Changed: "..changed)