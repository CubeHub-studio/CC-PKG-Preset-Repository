if not turtle then print("Not a turtle.") return end; local ok,d=turtle.inspect(); print(tostring(ok)); if d then print(textutils.serialize(d)) end
