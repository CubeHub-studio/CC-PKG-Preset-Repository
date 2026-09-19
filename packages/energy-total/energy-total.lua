local total=0; for _,s in ipairs(peripheral.getNames()) do if peripheral.hasType(s,"energy_storage") then total=total+peripheral.call(s,"getEnergy") end end; print(total)
