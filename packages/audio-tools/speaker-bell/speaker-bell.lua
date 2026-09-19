for _,n in ipairs(peripheral.getNames()) do if peripheral.getType(n)=="speaker" then peripheral.call(n,"playNote","block.bell",1,12) end end
