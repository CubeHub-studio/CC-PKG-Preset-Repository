for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="drive" and peripheral.call(s,"isDiskPresent") then print(s.." audio="..tostring(peripheral.call(s,"hasAudio"))) end end
