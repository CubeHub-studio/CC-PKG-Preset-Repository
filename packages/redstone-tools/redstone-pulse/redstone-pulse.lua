local side=arg[1] or "back"; local t=tonumber(arg[2]) or 1; redstone.setOutput(side,true); sleep(t); redstone.setOutput(side,false); print("Pulse complete.")
