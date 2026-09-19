local src,dst=arg[1],arg[2]
if not src or not dst then print("Usage: fs-copy-tree <source> <destination>"); return end
if not fs.isDir(src) or fs.exists(dst) then print("Source must exist and destination must not."); return end
local files,bytes=0,0
local function copy(a,b)
 fs.makeDir(b)
 for _,n in ipairs(fs.list(a)) do local s=fs.combine(a,n); local d=fs.combine(b,n)
  if fs.isDir(s) then copy(s,d) else
   local i=fs.open(s,"rb"); local data=i.readAll(); i.close()
   local o=fs.open(d,"wb"); o.write(data); o.close(); files=files+1; bytes=bytes+#data
  end
 end
end
copy(src,dst); print(("Copied %d files (%d bytes)."):format(files,bytes))