for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="modem" then local p=peripheral.wrap(s); print(s.." wireless="..tostring(p.isWireless())) end end
