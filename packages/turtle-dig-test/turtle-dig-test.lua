if not turtle then print("Not a turtle.") return end; local ok,d=turtle.inspect(); print("Block: "..tostring(ok)); if d then print(d.name) end
