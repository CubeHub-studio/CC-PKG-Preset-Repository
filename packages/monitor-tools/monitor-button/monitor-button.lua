local label=table.concat(arg," "); if label=="" then label="BUTTON" end
local names={}
for _,n in ipairs(peripheral.getNames()) do if peripheral.getType(n)=="monitor" then names[#names+1]=n end end
if #names==0 then print("No monitor found.") return end
for _,n in ipairs(names) do local m=peripheral.wrap(n); m.clear(); m.setCursorPos(1,1); m.write("["..label.."]") end
print("Press the monitor button to report clicks. Q exits.")
while true do local e,side,x,y=os.pullEvent(); if e=="key" and side==keys.q then break elseif e=="monitor_touch" then print(("Touch: %s (%d,%d)"):format(side,x,y)) end end