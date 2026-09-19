local mode=arg[1] or "server"; local protocol=arg[2] or "ccpkg-rpc"; local m=peripheral.find("modem")
if not m then print("No modem."); return end
rednet.open(peripheral.getName(m))
if mode=="server" then
 print("RPC server on "..protocol)
 while true do
  local id,r=rednet.receive(protocol)
  if type(r)=="table" and r.method=="time" then rednet.send(id,{ok=true,result=os.time()},protocol)
  elseif type(r)=="table" and r.method=="label" then rednet.send(id,{ok=true,result=os.getComputerLabel()},protocol)
  elseif type(r)=="table" and r.method=="echo" then rednet.send(id,{ok=true,result=r.params},protocol)
  else rednet.send(id,{ok=false,error="unknown method"},protocol) end
 end
else
 local id=tonumber(arg[3]) or rednet.lookup(protocol,arg[3] or "")
 if not id then print("Server not found."); return end
 rednet.send(id,{method=arg[4] or "time",params=table.concat(arg," ",5)},protocol)
 local _,reply=rednet.receive(protocol,5); print(reply and textutils.serialize(reply) or "Timed out.")
end