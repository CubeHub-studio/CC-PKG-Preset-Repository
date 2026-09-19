local length=tonumber(arg[1]); if not length or length<1 then print("Usage: turtle-farm-row <length> [--replant]"); return end
local replant=arg[2]=="--replant"; local harvested=0
for i=1,length do local ok,d=turtle.inspectDown(); if ok then local age=d.state and (d.state.age or d.state.growth); if age==nil or tonumber(age)>=7 then if turtle.digDown() then harvested=harvested+1; if replant then turtle.placeDown() end end end end; if i<length and not turtle.forward() then break end end
print("Harvested "..harvested.." position(s).")