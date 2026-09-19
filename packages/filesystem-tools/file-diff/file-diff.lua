local a,b=arg[1],arg[2]; if not a or not b then print("Usage: file-diff <file1> <file2>"); return end
local function read(p)local h=fs.open(p,"r"); if not h then return nil end; local t={}; while true do local l=h.readLine(); if not l then break end; t[#t+1]=l end; h.close(); return t end
local x,y=read(a),read(b); if not x or not y then print("File missing."); return end
local max=math.max(#x,#y); local d=0; for i=1,max do if x[i]~=y[i] then d=d+1; print(("- %s"):format(x[i] or "(missing)")); print(("+ %s"):format(y[i] or "(missing)")) end end; print("Different lines: "..d)