if not turtle then print("Not a turtle.") return end
local side=arg[1] or "front"
local fn=({front=turtle.compare,up=turtle.compareUp,down=turtle.compareDown})[side]
if not fn then print("Usage: turtle-compare [front|up|down]") return end
print(tostring(fn()))