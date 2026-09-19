local found=false
while true do
 local total,cap=0,0; found=false
 for _,n in ipairs(peripheral.getNames()) do if peripheral.hasType(n,"energy_storage") then local p=peripheral.wrap(n); total=total+p.getEnergy(); cap=cap+p.getEnergyCapacity(); found=true end end
 term.setCursorPos(1,1); term.clearLine(); if found then print(("Energy: %.0f / %.0f FE (%.1f%%)"):format(total,cap,cap>0 and total/cap*100 or 0)) else print("No energy storage peripherals.") end
 local t=os.startTimer(1); local e,k=os.pullEvent(); if e=="key" and k==keys.q then break end
end