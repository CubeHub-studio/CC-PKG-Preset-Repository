local delay=tonumber(arg[1]) or 2; local duration=tonumber(arg[2]) or 30
local function draw()
 term.clear(); term.setCursorPos(1,1); print("Fluid Dashboard")
 for _,n in ipairs(peripheral.getNames()) do
  if peripheral.hasType(n,"fluid_storage") then print("\n"..n); local p=peripheral.wrap(n)
   for i,t in pairs(p.tanks()) do if t then print(("tank %s: %s %d"):format(i,t.name or "unknown",t.amount or 0)) end end
  end
 end
end
local untilTime=os.clock()+duration; while os.clock()<untilTime do draw(); os.sleep(delay) end