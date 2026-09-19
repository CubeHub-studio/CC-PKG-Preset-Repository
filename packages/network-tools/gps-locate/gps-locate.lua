local x,y,z=gps.locate(3); if x then print(("Position: %d %d %d"):format(x,y,z)) else print("GPS locate failed.") end
