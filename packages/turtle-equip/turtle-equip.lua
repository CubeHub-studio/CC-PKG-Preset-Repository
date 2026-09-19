if not turtle then print("Not a turtle.") return end
local side=(arg[1] or "left"):lower()
local fn=side=="right" and turtle.equipRight or side=="left" and turtle.equipLeft
if not fn then print("Usage: turtle-equip [left|right]") return end
local ok,err=fn()
print(ok and ("Equipped item on "..side) or ("No item equipped: "..tostring(err)))