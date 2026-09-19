math.randomseed(os.epoch("utc")); local a=tonumber(arg[1]) or 1; local b=tonumber(arg[2]) or 100; for i=1,tonumber(arg[3]) or 1 do print(math.random(a,b)) end
