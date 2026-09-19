if not turtle then print("Not a turtle.") return end; local n=tonumber(arg[1]) or 1; print(tostring(turtle.refuel(n))) print("Fuel: "..turtle.getFuelLevel())
