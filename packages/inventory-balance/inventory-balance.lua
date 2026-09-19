local a,b=arg[1],arg[2]; if not a or not b then print("Usage: inventory-balance <source> <destination>"); return end
if not peripheral.hasType(a,"inventory") or not peripheral.hasType(b,"inventory") then print("Both must be inventories."); return end
local src=peripheral.wrap(a); local moved=0
for s in pairs(src.list()) do moved=moved+(src.pushItems(b,s) or 0) end
print("Moved "..moved.." item(s).")