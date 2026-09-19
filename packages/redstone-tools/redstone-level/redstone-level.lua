local side=arg[1] or "back"; local level=math.max(0,math.min(15,tonumber(arg[2]) or 0)); redstone.setAnalogOutput(side,level); print(side.." level="..level)
