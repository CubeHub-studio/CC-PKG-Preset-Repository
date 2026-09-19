if not multishell then print("Multishell unavailable."); return end
for _,id in ipairs(multishell.getTabs()) do print(id.." "..tostring(multishell.getTitle(id))) end