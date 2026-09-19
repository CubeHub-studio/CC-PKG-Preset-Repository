local file=arg[1]; if not file then print("Usage: turtle-route <file>"); return end
if not fs.exists(file) then print("Route file not found."); return end
local h=fs.open(file,"r"); local lines={}; while true do local l=h.readLine(); if not l then break end; lines[#lines+1]=l end; h.close()
local move={forward=turtle.forward,back=turtle.back,up=turtle.up,down=turtle.down}
for i,line in ipairs(lines) do local d,n=line:match("^(%a+)%s*(%d*)"); n=tonumber(n) or 1
 if d=="left" or d=="right" then local f=d=="left" and turtle.turnLeft or turtle.turnRight; for _=1,n do f() end
 elseif d=="around" then turtle.turnLeft();turtle.turnLeft()
 elseif move[d] then for _=1,n do local ok,err=move[d](); if not ok then print("Stopped line "..i..": "..tostring(err)); return end end
 else print("Unknown command line "..i); return end
end
print("Route complete.")