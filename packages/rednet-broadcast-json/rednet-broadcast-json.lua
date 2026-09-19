local protocol=arg[1] or "ccpkg"
local msg=table.concat(arg," ",2)
if msg=="" then print("Usage: rednet-broadcast-json <protocol> <text>") return end
local modem
for _,n in ipairs(peripheral.getNames()) do if peripheral.getType(n)=="modem" then modem=n break end end
if not modem then print("No modem found.") return end
rednet.open(modem); rednet.broadcast(msg,protocol); print("Broadcast sent.")