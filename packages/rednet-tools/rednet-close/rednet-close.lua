local s=arg[1] or peripheral.find("modem"); if type(s)=="string" then rednet.close(s) elseif s then rednet.close(peripheral.getName(s)) else print("No modem.") return end; print("Rednet closed.")
