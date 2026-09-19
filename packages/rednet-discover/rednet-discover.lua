local protocol=arg[1] or "ccpkg-discovery"; local seconds=tonumber(arg[2]) or 5; local m=peripheral.find("modem"); if not m then print("No modem."); return end
rednet.open(peripheral.getName(m)); rednet.broadcast({request="discover",computer=os.getComputerID(),label=os.getComputerLabel()},protocol); print("Discovering "..protocol.." for "..seconds.."s")
local seen={}; local untilTime=os.clock()+seconds
while os.clock()<untilTime do local id,msg=rednet.receive(protocol,math.max(0,untilTime-os.clock())); if id and not seen[id] then seen[id]=true; print(id.." "..textutils.serialize(msg)) end end
print("Discovered: "..#seen)