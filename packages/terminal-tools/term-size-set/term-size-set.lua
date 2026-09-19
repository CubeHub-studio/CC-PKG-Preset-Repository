local s=tonumber(arg[1]); if term.setTextScale and s then term.setTextScale(s); print("Scale set.") else print("Usage: term-size-set <scale>") end
