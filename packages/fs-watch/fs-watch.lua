local path=arg[1] or "."; local seconds=tonumber(arg[2]) or 60; local function snap() return textutils.serialize(fs.list(path)) end
if not fs.exists(path) then print("Path not found."); return end
local old=snap(); print("Watching "..path.." for "..seconds.."s"); local untilTime=os.clock()+seconds
while os.clock()<untilTime do os.sleep(.5); local now=snap(); if now~=old then print("Directory changed."); old=now end end