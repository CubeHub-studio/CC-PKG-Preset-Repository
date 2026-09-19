for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="monitor" then local m=peripheral.wrap(s); local w,h=m.getSize(); print(s.." "..w.."x"..h.." scale="..m.getTextScale()) end end
