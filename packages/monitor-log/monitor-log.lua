local msg=table.concat(arg," ")
if msg=="" then print("Usage: monitor-log <message>") return end
for _,n in ipairs(peripheral.getNames()) do
 if peripheral.getType(n)=="monitor" then local m=peripheral.wrap(n); m.setCursorPos(1,m.getCursorPos() and 1 or 1); m.write(os.date("%H:%M:%S ")..msg) end
end