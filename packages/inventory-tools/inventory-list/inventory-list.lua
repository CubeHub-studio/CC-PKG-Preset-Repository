for _,s in ipairs(peripheral.getNames()) do if peripheral.hasType(s,"inventory") then print("["..s.."]"); for slot,v in pairs(peripheral.call(s,"list")) do print(slot..": "..v.count) end end end
