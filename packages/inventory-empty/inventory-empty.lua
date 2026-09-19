local from,to=arg[1],arg[2]; if not from or not to then print("Usage: inventory-empty <source> <destination> --yes"); return end
if arg[3]~="--yes" then print("This moves every item. Add --yes to confirm."); return end
if not peripheral.hasType(from,"inventory") or not peripheral.hasType(to,"inventory") then print("Both must be inventories."); return end
local p=peripheral.wrap(from); local moved=0
for s in pairs(p.list()) do moved=moved+(p.pushItems(to,s) or 0) end
print("Moved "..moved.." item(s).")