local url=arg[1]; local seconds=tonumber(arg[2]) or 30; if not url then print("Usage: websocket-monitor <url> [seconds]"); return end
local ws,e=http.websocket(url); if not ws then print("Connect failed: "..tostring(e)); return end
print("Connected."); local untilTime=os.clock()+seconds
while os.clock()<untilTime do local msg,reason=ws.receive(.5); if msg then print(msg) elseif reason and reason~="Timed out" then print(reason); break end end
ws.close(); print("Closed.")