local protocol=arg[1] or "ccpkg"
local modem
for _,n in ipairs(peripheral.getNames()) do if peripheral.getType(n)=="modem" then modem=n break end end
if not modem then print("No modem found.") return end
rednet.open(modem); rednet.broadcast({type="discover",time=os.epoch("utc")},protocol)
print("Discovery sent on "..protocol..". Listening for 3 seconds...")
local endAt=os.clock()+3
while os.clock()<endAt do
 local timer=os.startTimer(endAt-os.clock()); local e,id,msg,p=os.pullEvent()
 if e=="rednet_message" and p==protocol then print(id..": "..textutils.serialize(msg)) end
end