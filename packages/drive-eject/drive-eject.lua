for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="drive" then peripheral.call(s,"ejectDisk"); print("Ejected "..s) end end
