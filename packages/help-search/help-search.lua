local q=table.concat(arg," "):lower(); if q=="" then print("Usage: help-search <term>") return end; for _,p in ipairs(help.list()) do if p:lower():find(q,1,true) then print(p) end end
