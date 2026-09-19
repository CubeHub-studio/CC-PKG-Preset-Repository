if not turtle then print("Not a turtle.") return end; local n=tonumber(arg[1]) or 1; for i=1,n do if not turtle.back() then print("Blocked at "..i); break end end
