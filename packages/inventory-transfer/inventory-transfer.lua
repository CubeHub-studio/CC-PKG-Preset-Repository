local from,to,slot,limit=arg[1],arg[2],tonumber(arg[3]),tonumber(arg[4])
if not from or not to or not slot then print("Usage: inventory-transfer <from> <to> <slot> [limit]"); return end
if not peripheral.hasType(from,"inventory") or not peripheral.hasType(to,"inventory") then print("Both peripherals must be inventories."); return end
local moved=peripheral.call(from,"pushItems",to,slot,limit); print("Moved: "..tostring(moved))