local path=arg[1]; if not path then print("Usage: checksum <file>"); return end
local h=fs.open(path,"rb"); if not h then print("File not found."); return end; local data=h.readAll() or ""; h.close()
local sum=0; for i=1,#data do sum=(sum+data:byte(i)*i)%4294967296 end
print(("Size: %d bytes"):format(#data)); print(("Checksum: %08x"):format(sum))