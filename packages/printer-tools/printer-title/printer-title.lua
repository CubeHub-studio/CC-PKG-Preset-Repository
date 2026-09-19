local t=table.concat(arg," "); for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="printer" then peripheral.call(s,"setPageTitle",t) end end
