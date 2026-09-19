local delay=tonumber(arg[1]) or 2; local duration=tonumber(arg[2]) or 30
local function draw()
 term.clear(); term.setCursorPos(1,1); print("Energy Dashboard")
 local total,cap=0,0
 for _,n in ipairs(peripheral.getNames()) do
  if peripheral.hasType(n,"energy_storage") then local p=peripheral.wrap(n); local e=p.getEnergy(); local c=p.getEnergyCapacity()
   total=total+e; cap=cap+c; print(("%-24s %d/%d"):format(n,e,c))
  end
 end
 print(""); print("TOTAL "..total.."/"..cap); if cap>0 then print(("CHARGE %.1f%%"):format(total/cap*100)) end
end
local untilTime=os.clock()+duration; while os.clock()<untilTime do draw(); os.sleep(delay) end