local root=arg[1] or "."; local limit=tonumber(arg[2]) or 25; local rows={}
local function walk(p) for _,n in ipairs(fs.list(p)) do local q=fs.combine(p,n); if fs.isDir(q) then walk(q) else rows[#rows+1]={q,fs.getSize(q)} end end end
if not fs.isDir(root) then print("Not a directory."); return end
walk(root); table.sort(rows,function(a,b)return a[2]>b[2] end)
for i=1,math.min(limit,#rows) do print(("%8d  %s"):format(rows[i][2],rows[i][1])) end
print("Files scanned: "..#rows)