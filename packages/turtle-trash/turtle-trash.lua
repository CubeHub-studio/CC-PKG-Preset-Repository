local slot=tonumber(arg[1]); local dir=arg[2] or "front"; local f=dir=="up" and turtle.dropUp or dir=="down" and turtle.dropDown or turtle.drop
if slot then if slot<1 or slot>16 then print("Slot 1-16."); return end; turtle.select(slot) end
local ok,err=f(); print(ok and "Dropped selected stack." or ("Nothing dropped: "..tostring(err)))