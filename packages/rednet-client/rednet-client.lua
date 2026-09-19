local target=arg[1]; local protocol=arg[2] or "ccpkg-server"; local cmd=arg[3] or "ping"
if not target then print("Usage: rednet-client <id|host> [protocol] [ping|echo] [data]"); return end
local m=peripheral.find("modem"); if not m then print("No modem."); return end
rednet.open(peripheral.getName(m)); local id=tonumber(target) or rednet.lookup(protocol,target)
if not id then print("Target not found."); return end
rednet.send(id,{command=cmd,data=table.concat(arg," ",4)},protocol)
local from,reply=rednet.receive(protocol,5); print(from and textutils.serialize(reply) or "Timed out.")