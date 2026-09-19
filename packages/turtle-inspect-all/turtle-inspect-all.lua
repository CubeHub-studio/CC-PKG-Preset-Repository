if not turtle then print("Not a turtle.") return end
local sides={{"front",turtle.inspect},{"up",turtle.inspectUp},{"down",turtle.inspectDown}}
for _,v in ipairs(sides) do local ok,data=v[2](); if ok then print(v[1]..": "..textutils.serialize(data)) else print(v[1]..": empty") end end