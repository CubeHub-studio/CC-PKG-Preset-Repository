local n=0; for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="monitor" then peripheral.call(s,"clear"); n=n+1 end end; print("Cleared "..n.." monitor(s).")
