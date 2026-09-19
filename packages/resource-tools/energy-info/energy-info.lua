for _,s in ipairs(peripheral.getNames()) do if peripheral.hasType(s,"energy_storage") then local p=peripheral.wrap(s); print(s.." "..p.getEnergy().."/"..p.getEnergyCapacity()) end end
