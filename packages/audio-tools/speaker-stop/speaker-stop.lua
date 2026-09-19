for _,n in ipairs(peripheral.getNames()) do if peripheral.getType(n)=="speaker" then peripheral.call(n,"stop") end end
