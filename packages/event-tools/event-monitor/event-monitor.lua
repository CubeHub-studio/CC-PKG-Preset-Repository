print("Event monitor. Press Q."); while true do local e,a,b,c,d=os.pullEvent(); if e=="key" and a==keys.q then break end; print(textutils.serialize({e,a,b,c,d})) end
