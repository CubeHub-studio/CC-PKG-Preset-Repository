local n=arg[1]; if not n then print("Usage: inventory-capacity <peripheral>"); return end
if not peripheral.hasType(n,"inventory") then print("Not an inventory."); return end
local p=peripheral.wrap(n); local used,items,capacity=0,0,0
for s=1,p.size() do local d=p.getItemDetail(s); capacity=capacity+p.getItemLimit(s); if d then used=used+1; items=items+d.count end end
print("Slots: "..p.size()); print("Used: "..used); print("Items: "..items); print("Capacity: "..capacity); print(("Usage: %.1f%%"):format(used/p.size()*100))