local s=arg[1] or peripheral.find("modem"); if type(s)=="string" then rednet.open(s) elseif s then rednet.open(peripheral.getName(s)) else print("No modem.") return end; print("Rednet opened.")
