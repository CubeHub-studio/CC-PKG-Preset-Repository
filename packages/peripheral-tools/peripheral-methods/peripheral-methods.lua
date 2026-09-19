local n=arg[1]; if not n then print("Usage: peripheral-methods <name>"); return end
if not peripheral.isPresent(n) then print("Peripheral not found."); return end
local methods=peripheral.getMethods(n) or {}; table.sort(methods); print(n.." methods ("..#methods..")")
for _,m in ipairs(methods) do print(" - "..m) end