local n=arg[1]; if not n then print("Usage: inventory-duplicates <peripheral>"); return end
if not peripheral.hasType(n,"inventory") then print("Not an inventory."); return end
local p=peripheral.wrap(n); local totals={}
for s,d in pairs(p.list()) do local x=p.getItemDetail(s); local id=x and (x.name.."|"..tostring(x.nbt)) or "unknown"; totals[id]=(totals[id] or 0)+d.count end
for id,c in pairs(totals) do print(("%8d %s"):format(c,id)) end