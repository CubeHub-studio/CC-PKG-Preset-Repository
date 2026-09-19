local v=tonumber(arg[1]) or 1; for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="speaker" then peripheral.call(s,"setVolume",v); print(s.." volume="..v) end end
