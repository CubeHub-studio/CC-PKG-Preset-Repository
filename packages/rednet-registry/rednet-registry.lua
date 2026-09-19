local protocol=arg[1] or "ccpkg-service"; local name=arg[2]; local m=peripheral.find("modem")
if not m then print("No modem."); return end
rednet.open(peripheral.getName(m))
if name then
 rednet.host(protocol,name); print("Hosting "..name.." on "..protocol)
 while true do os.pullEvent() end
else
 local ids={rednet.lookup(protocol)}; print("Services for "..protocol..":")
 for _,id in ipairs(ids) do print("  "..id) end
end