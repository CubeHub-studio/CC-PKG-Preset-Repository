local seen={}; for _,s in ipairs(peripheral.getNames()) do for _,t in ipairs(peripheral.getType(s) or {}) do seen[t]=true end end; for t in pairs(seen) do print(t) end
