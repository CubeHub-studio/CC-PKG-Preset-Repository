if not multishell then print("Multishell unavailable.") return end; for i in ipairs(multishell.getAll() or {}) do print(i.." "..tostring(multishell.getTitle(i))) end
