if not turtle then print("Not a turtle.") return end; for i=1,16 do local d=turtle.getItemDetail(i); if d then print(i..": "..d.name.." x"..d.count) end end
