for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="monitor" then local w,h=peripheral.call(s,"getSize"); print(s..": "..w.."x"..h) end end
