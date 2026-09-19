local n=arg[1]; local seconds=tonumber(arg[2]) or 30; if not n then print("Usage: inventory-monitor <peripheral> [seconds]"); return end
if not peripheral.hasType(n,"inventory") then print("Not an inventory."); return end
local p=peripheral.wrap(n); local old=textutils.serialize(p.list()); print("Monitoring "..n)
local untilTime=os.clock()+seconds
while os.clock()<untilTime do os.sleep(.5); local now=textutils.serialize(p.list()); if now~=old then print("Inventory changed."); old=now end end