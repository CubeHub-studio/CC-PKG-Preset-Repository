for _,k in ipairs(settings.getNames()) do print(k.." = "..textutils.serialize(settings.get(k))) end
