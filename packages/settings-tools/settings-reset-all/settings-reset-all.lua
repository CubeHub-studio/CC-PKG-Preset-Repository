if arg[1]~="--yes" then print("This resets all changed settings. Use --yes to confirm."); return end
for _,n in ipairs(settings.getNames()) do if settings.getDetails(n) and settings.getDetails(n).changed then settings.unset(n) end end
print("Requested reset of changed settings.")