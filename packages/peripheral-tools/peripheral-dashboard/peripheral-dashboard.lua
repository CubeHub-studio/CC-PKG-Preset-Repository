local delay=tonumber(arg[1]) or 2; local duration=tonumber(arg[2]) or 30
local function draw()
 term.clear(); term.setCursorPos(1,1); print("Peripheral Dashboard")
 for _,n in ipairs(peripheral.getNames()) do local types={peripheral.getType(n)}; print(n.." : "..table.concat(types,", ")) end
end
local untilTime=os.clock()+duration; while os.clock()<untilTime do draw(); os.sleep(delay) end