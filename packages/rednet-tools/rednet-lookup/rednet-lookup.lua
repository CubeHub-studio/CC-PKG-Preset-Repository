local h=arg[1]; if not h then print("Usage: rednet-lookup <hostname>") return end; local id=rednet.lookup("",h); print(tostring(id))
