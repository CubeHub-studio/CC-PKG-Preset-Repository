local path,old,new=arg[1],arg[2],arg[3]; if not path or old==nil or new==nil then print("Usage: file-replace <file> <old> <new>"); return end
local h=fs.open(path,"r"); if not h then print("File not found."); return end; local s=h.readAll() or ""; h.close(); local count=0
s=s:gsub(old,function() count=count+1; return new end)
local o=fs.open(path,"w"); o.write(s); o.close(); print("Replacements: "..count)