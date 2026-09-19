local protocol="ccpkg-ping"
local modem
for _,name in ipairs(peripheral.getNames()) do
  if peripheral.getType(name)=="modem" then modem=name break end
end
if not modem then print("No modem found.") return end
rednet.open(modem)
if arg[1]=="--server" then
  print("Rednet ping server running. Press Q to stop.")
  while true do
    local e,a,msg,p=os.pullEvent()
    if e=="key" and a==keys.q then break end
    if e=="rednet_message" and p==protocol and type(msg)=="table" and msg.type=="ping" then
      rednet.send(a,{type="pong",token=msg.token},protocol)
      print("Reply sent to "..a)
    end
  end
  return
end
local id=tonumber(arg[1]); local timeout=tonumber(arg[2]) or 3
if not id then print("Usage: rednet-ping <computer-id> [timeout]") print("       rednet-ping --server") return end
local token=tostring(os.epoch("utc"))..":"..tostring(math.random(1,1000000))
local started=os.clock()
rednet.send(id,{type="ping",token=token},protocol)
while os.clock()-started<timeout do
  local timer=os.startTimer(timeout-(os.clock()-started))
  local e,a,msg,p=os.pullEvent()
  if e=="rednet_message" and a==id and p==protocol and type(msg)=="table" and msg.type=="pong" and msg.token==token then
    print(("Reply from %d: %.3fs"):format(id,os.clock()-started)); return
  elseif e=="timer" then break end
end
print("Request timed out.")