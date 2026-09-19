if not turtle then print("Not a turtle.") return end
for i=1,16 do if turtle.getItemCount(i)==0 then print("Empty slot: "..i); return end end
print("No empty slots.")