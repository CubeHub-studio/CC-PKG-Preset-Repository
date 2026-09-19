local name,q=arg[1],arg[2]
if not name or not q then print("Usage: inventory-search <peripheral> <query>"); return end
if not peripheral.hasType(name,"inventory") then print("Not an inventory."); return end
local p=peripheral.wrap(name); q=q:lower(); local total=0
for s,d in pairs(p.list()) do
 local x=p.getItemDetail(s); local label=x and (x.displayName or x.name) or ""
 if (x and x.name and x.name:lower():find(q,1,true)) or label:lower():find(q,1,true) then
  print(("%3d  %5d  %s"):format(s,d.count,label)); total=total+d.count
 end
end
print("Matching items: "..total)