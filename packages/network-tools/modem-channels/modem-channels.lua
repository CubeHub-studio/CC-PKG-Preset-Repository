local m=peripheral.find("modem"); if not m then print("No modem."); return end
print("Modem: "..peripheral.getName(m))
local open=m.getOpenChannels and m.getOpenChannels() or {}
for ch in pairs(open) do print("Open: "..ch) end
local op,ch=arg[1],tonumber(arg[2])
if op=="open" and ch then m.open(ch); print("Opened "..ch)
elseif op=="close" and ch then m.close(ch); print("Closed "..ch)
elseif op then print("Usage: modem-channels [open|close] <channel>") end