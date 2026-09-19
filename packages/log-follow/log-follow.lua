local path=arg[1]; local seconds=tonumber(arg[2]) or 30
if not path then print("Usage: log-follow <file> [seconds]"); return end
local function read() local h=fs.open(path,"r"); if not h then return "" end; local s=h.readAll() or ""; h.close(); return s end
local data=read(); print("Following "..path.." for "..seconds.."s")
local deadline=os.clock()+seconds
while os.clock()<deadline do
 os.sleep(0.25); local now=read()
 if #now>#data then for line in now:sub(#data+1):gmatch("(.-)\n") do print(line) end; data=now end
end