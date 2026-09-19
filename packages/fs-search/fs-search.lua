local root,q=arg[1] or ".",arg[2] or ""; if q=="" then print("Usage: fs-search <root> <text>"); return end
local hits=0
local function walk(p)
 for _,n in ipairs(fs.list(p)) do local f=fs.combine(p,n)
  if fs.isDir(f) then walk(f) else
   local match=n:lower():find(q:lower(),1,true)
   if not match then local h=fs.open(f,"r"); local s=h and (h.readAll() or "") or ""; if h then h.close() end; match=s:lower():find(q:lower(),1,true) end
   if match then print(f); hits=hits+1 end
  end
 end
end
if not fs.exists(root) then print("Root not found."); return end
walk(root); print("Matches: "..hits)