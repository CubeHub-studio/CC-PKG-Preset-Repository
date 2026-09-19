local u=arg[1]; if not u then print("Usage: http-head <url>") return end; local ok,e=http.checkURL(u); print(tostring(ok)); if e then print(e) end
