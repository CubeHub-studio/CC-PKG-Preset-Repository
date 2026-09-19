for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="drive" then print(s.." present="..tostring(peripheral.call(s,"isDiskPresent"))) end end
