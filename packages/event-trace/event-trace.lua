local duration=tonumber(arg[1]) or 20; local untilTime=os.clock()+duration
print("Tracing events for "..duration.." seconds. Ctrl-T still terminates.")
while os.clock()<untilTime do
 local e={os.pullEventRaw()}; local out={}
 for i,v in ipairs(e) do out[#out+1]=tostring(v) end
 print(table.concat(out," | "))
end
print("Trace complete.")