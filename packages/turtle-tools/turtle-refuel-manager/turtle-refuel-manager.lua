local target=tonumber(arg[1]) or 1000; local original=turtle.getSelectedSlot(); print("Fuel: "..turtle.getFuelLevel().."/"..turtle.getFuelLimit())
for s=1,16 do if turtle.getFuelLevel()>=target then break end; turtle.select(s); if turtle.getItemCount(s)>0 then turtle.refuel() end end
turtle.select(original); print("Fuel after: "..turtle.getFuelLevel())