local n,method=arg[1],arg[2]; if not n or not method then print("Usage: peripheral-call <name> <method> [args...]"); return end
if not peripheral.isPresent(n) then print("Peripheral not found."); return end
local vals={}; for i=3,#arg do vals[#vals+1]=tonumber(arg[i]) or arg[i] end
local ok,a,b,c,d=pcall(peripheral.call,n,method,table.unpack(vals)); if not ok then print("Call failed: "..tostring(a)); return end
print(textutils.serialize({a,b,c,d}))