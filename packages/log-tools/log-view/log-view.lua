local path,q=arg[1],arg[2]
if not path then print("Usage: log-view <file> [search]"); return end
local h=fs.open(path,"r"); if not h then print("File not found."); return end
local s=h.readAll() or ""; h.close(); local shown,lineNo=0,0
for line in (s.."\n"):gmatch("(.-)\n") do
 lineNo=lineNo+1
 if not q or line:lower():find(q:lower(),1,true) then
  print(("%5d | %s"):format(lineNo,line)); shown=shown+1
  if shown%18==0 then print("-- Enter for more, Q to quit --"); if read():lower()=="q" then break end end
 end
end
print("Shown: "..shown)