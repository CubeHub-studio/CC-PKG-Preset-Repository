local u=arg[1]; if not u then print("Usage: http-check <url>") return end; local ok,msg=http.checkURL(u); print(tostring(ok).." "..tostring(msg))
