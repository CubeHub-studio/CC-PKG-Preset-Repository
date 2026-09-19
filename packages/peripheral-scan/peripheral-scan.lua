for _,s in ipairs(peripheral.getNames()) do print(s.." "..table.concat(peripheral.getType(s) or {},"/")) end
