local side=arg[1]; local label=table.concat(arg," ",2); if not side or label=="" then print("Usage: computer-label <side> <label>") return end; peripheral.call(side,"setLabel",label); print("Set.")
