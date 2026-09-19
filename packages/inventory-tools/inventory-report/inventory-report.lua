local name=arg[1]; if not name then print("Usage: inventory-report <peripheral>"); return end
if not peripheral.hasType(name,"inventory") then print("Not an inventory."); return end
local p=peripheral.wrap(name); local totals={}; local used=0
for s,d in pairs(p.list()) do
 used=used+1; local x=p.getItemDetail(s); local id=x and x.name or "unknown"; totals[id]=(totals[id] or 0)+d.count
end
local rows={}; for id,c in pairs(totals) do rows[#rows+1]={id,c} end
table.sort(rows,function(a,b)return a[2]>b[2] end)
print("Used slots: "..used.."/"..p.size())
for _,r in ipairs(rows) do print(("%6d  %s"):format(r[2],r[1])) end
print("Distinct items: "..#rows)