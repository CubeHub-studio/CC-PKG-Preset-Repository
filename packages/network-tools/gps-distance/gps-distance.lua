local a,b,c,d=tonumber(arg[1]),tonumber(arg[2]),tonumber(arg[3]),tonumber(arg[4])
if not a or not b or not c or not d then print("Usage: gps-distance <x1> <z1> <x2> <z2>") return end
print(("Distance: %.3f blocks"):format(math.sqrt((c-a)^2+(d-b)^2)))