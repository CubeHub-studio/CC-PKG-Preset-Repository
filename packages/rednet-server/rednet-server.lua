local protocol=arg[1] or "ccpkg-server"; local m=peripheral.find("modem")
if not m then print("No modem."); return end
local mn=peripheral.getName(m); rednet.open(mn); local host=os.getComputerLabel() or ("computer-"..os.getComputerID()); rednet.host(protocol,host)
print("Hosting "..host.." on "..protocol)
while true do
 local id,msg=rednet.receive(protocol)
 if type(msg)=="table" and msg.command=="ping" then rednet.send(id,{ok=true,id=os.getComputerID()},protocol)
 elseif type(msg)=="table" and msg.command=="echo" then rednet.send(id,{ok=true,data=msg.data},protocol)
 else print(id..": "..tostring(msg)) end
end