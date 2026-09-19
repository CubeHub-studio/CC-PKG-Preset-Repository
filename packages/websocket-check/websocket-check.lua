local u=arg[1]; if not u then print("Usage: websocket-check <url>") return end; local ok,s=pcall(http.websocket,u); print("Connected: "..tostring(ok)); if ok and s then s.close() end
