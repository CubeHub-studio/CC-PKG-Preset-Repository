local url=arg[1]; if not url then print("Usage: websocket-chat <ws:// or wss:// URL>"); return end
local ws,e=http.websocket(url); if not ws then print("Connect failed: "..tostring(e)); return end
print("Connected. Type /quit to close.")
while true do
 local line=read()
 if line=="/quit" then ws.close(); break end
 if not pcall(ws.send,line) then print("Send failed."); break end
 local msg,reason=ws.receive(2)
 if msg then print("< "..msg) elseif reason then print("[receive] "..reason) end
end