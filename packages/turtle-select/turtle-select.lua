if not turtle then print("Not a turtle.") return end; local n=tonumber(arg[1]); if n and n>=1 and n<=16 then turtle.select(n); print("Selected "..n) else print("Usage: turtle-select <1-16>") end
