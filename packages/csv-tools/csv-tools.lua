local a={...}; local p=a[1]; if not p or not fs.exists(p) then print("Usage: csv-tools <file>"); return end
local h=fs.open(p,"r"); if not h then print("Cannot open file."); return end
local n=0
while true do
  local line=h.readLine()
  if not line then break end
  n=n+1
  print(n..": "..line)
end
h.close()
print("Rows: "..n)