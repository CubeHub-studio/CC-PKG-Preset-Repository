local duration=tonumber(arg[1]) or 30; local untilTime=os.clock()+duration
print("Watching setting_changed events for "..duration.." seconds.")
while os.clock()<untilTime do
 local e={os.pullEvent("setting_changed")}
 print(("Setting %s changed: %s -> %s"):format(tostring(e[2]),tostring(e[3]),tostring(e[4])))
end
print("Watch complete.")