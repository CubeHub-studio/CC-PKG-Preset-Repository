local length=tonumber(arg[1]); local height=tonumber(arg[2]) or 2; if not length or length<1 then print("Usage: turtle-tunnel <length> [height]"); return end
if height<1 or height>3 then print("Height must be 1-3."); return end
for i=1,length do turtle.dig(); if height>=2 then turtle.digUp() end; if height>=3 then turtle.digDown() end; if i<length and not turtle.forward() then print("Stopped at "..i); return end end
print("Tunnel complete.")