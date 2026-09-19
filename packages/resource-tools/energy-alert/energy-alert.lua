local threshold=tonumber(arg[1]) or 20; local seconds=tonumber(arg[2]) or 60; if threshold<0 or threshold>100 then print("Threshold 0-100."); return end
local untilTime=os.clock()+seconds; local alerted={}
while os.clock()<untilTime do
 for _,n in ipairs(peripheral.getNames()) do if peripheral.hasType(n,"energy_storage") then local p=peripheral.wrap(n); local e,c=p.getEnergy(),p.getEnergyCapacity(); local pct=c>0 and e/c*100 or 100
  if pct<threshold and not alerted[n] then print(("LOW %s %.1f%%"):format(n,pct)); alerted[n]=true elseif pct>=threshold then alerted[n]=nil end
 end end; os.sleep(2) end