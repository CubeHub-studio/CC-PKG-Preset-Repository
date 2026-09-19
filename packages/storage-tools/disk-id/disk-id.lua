for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="drive" and peripheral.call(s,"isDiskPresent") then print(s..": "..tostring(peripheral.call(s,"getDiskID"))) end end
