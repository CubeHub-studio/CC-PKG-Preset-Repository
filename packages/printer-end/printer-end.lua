for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="printer" then print(s.." "..tostring(peripheral.call(s,"endPage"))) end end
