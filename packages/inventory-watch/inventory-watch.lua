local name=arg[1]
if not name then for _,n in ipairs(peripheral.getNames()) do if peripheral.hasType(n,"inventory") then name=n break end end end
if not name or not peripheral.hasType(name,"inventory") then print("Usage: inventory-watch <inventory>") return end
local p=peripheral.wrap(name); local last=textutils.serialize(p.list())
print("Watching "..name.."; Q exits.")
while true do local now=textutils.serialize(p.list()); if now~=last then print("Inventory changed at "..os.date("%H:%M:%S")); last=now end; local t=os.startTimer(1); local e,k=os.pullEvent(); if e=="key" and k==keys.q then break end end