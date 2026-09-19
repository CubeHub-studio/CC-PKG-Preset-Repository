print("Touch monitor test. Press Q."); while true do local e,a,b,c=os.pullEvent(); if e=="monitor_touch" then print(a.." "..b..","..c) elseif e=="key" and a==keys.q then break end end
