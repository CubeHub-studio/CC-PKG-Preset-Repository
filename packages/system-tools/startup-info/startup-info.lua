for _,p in ipairs({"startup","startup.lua","bootfile","autorun"}) do print(p..": "..tostring(fs.exists(p))) end
