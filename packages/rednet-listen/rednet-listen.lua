local protocol=arg[1]
if not protocol then print("Usage: rednet-listen <protocol>") return end
local modem
for _,n in ipairs(peripheral.getNames()) do if peripheral.getType(n)=="modem" then modem=n break end end
if not modem then print("No modem found.") return end
rednet.open(modem); print("Listening on "..protocol.."; press Q to stop.")
while true do local e,a,msg,p=os.pullEvent(); if e=="key" and a==keys.q then break elseif e=="rednet_message" and p==protocol then print(a..": "..textutils.serialize(msg)) end end