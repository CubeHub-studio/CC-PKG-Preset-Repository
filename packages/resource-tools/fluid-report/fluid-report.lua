local found=0
for _,n in ipairs(peripheral.getNames()) do if peripheral.hasType(n,"fluid_storage") then found=found+1; print("\n"..n); local p=peripheral.wrap(n); for i,t in pairs(p.tanks()) do if t then print(("[%s] %s: %d/%s"):format(i,t.name or "unknown",t.amount or 0,t.capacity or "?")) end end end end
print("\nFluid peripherals: "..found)