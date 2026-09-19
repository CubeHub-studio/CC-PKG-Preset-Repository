local p=arg[1]; if not p then print("Usage: rednet-unhost <protocol>") return end; rednet.unhost(p); print("Unhosted.")
