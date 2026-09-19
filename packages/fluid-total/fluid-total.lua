local total=0; for _,s in ipairs(peripheral.getNames()) do if peripheral.hasType(s,"fluid_storage") then total=total+#peripheral.call(s,"tanks") end end; print(total)
