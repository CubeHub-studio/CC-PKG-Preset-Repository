for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="modem" then print(s.." wireless="..tostring(peripheral.call(s,"isWireless"))) end end
