local s=table.concat(arg," "); for _,n in ipairs(peripheral.getNames()) do if peripheral.getType(n)=="monitor" then local m=peripheral.wrap(n); m.write(s) end end
