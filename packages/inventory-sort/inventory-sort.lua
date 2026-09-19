local name=arg[1]; if not name then print("Usage: inventory-sort <peripheral>"); return end
if not peripheral.hasType(name,"inventory") then print("Not an inventory."); return end
local p=peripheral.wrap(name); local rows={}
for s,d in pairs(p.list()) do local x=p.getItemDetail(s); rows[#rows+1]={s,d.count,x and (x.displayName or x.name) or "unknown",x and x.name or ""} end
table.sort(rows,function(a,b)return a[3]:lower()<b[3]:lower() end)
for _,r in ipairs(rows) do print(("%3d %5d %-40s %s"):format(r[1],r[2],r[3],r[4])) end
print("Sorted view only; storage was not changed.")