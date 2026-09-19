if not turtle then print("Not a turtle.") return end; local side=arg[1] or "left"; local ok=turtle.equipLeft(); if side=="right" then ok=turtle.equipRight() end; print(tostring(ok))
