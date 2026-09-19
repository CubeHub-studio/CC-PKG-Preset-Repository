local ok,b=pcall(require,"cc.base64")
if not ok then print("cc.base64 is unavailable on this CC:Tweaked version.") return end
local mode=arg[1]
if mode=="encode" then
  print(b.encode(table.concat(arg," ",2)))
elseif mode=="decode" then
  local ok2,result=pcall(b.decode,table.concat(arg," ",2))
  if ok2 then print(result) else print("Decode failed: "..tostring(result)) end
else
  print("Usage: base64 encode <text>")
  print("       base64 decode <base64>")
end